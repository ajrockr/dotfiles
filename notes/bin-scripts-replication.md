# ~/bin Scripts Replication Guide

Personal scripts tracked at `~/bin/`. All are on `PATH` via `.bashrc` (`$HOME/bin` prepended).

---

## Tracked files

| Script | Purpose |
|--------|---------|
| `~/bin/dotfiles-sync` | Commit and push dotfiles to GitHub |
| `~/bin/notes` | Unified note management — create, view, delete, push |

---

## Required packages

```bash
sudo pacman -S git fzf glow
```

> `fzf` is used by `notes` for interactive fuzzy selection when no filename is given. `glow` renders markdown in the terminal — `notes` falls back to `less` if it's not installed.

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, all scripts are in place. Verify they are executable:

```bash
ls -l ~/bin/
chmod +x ~/bin/*
```

---

## Script reference

### `dotfiles-sync`

Wraps `git` against the bare dotfiles repo at `~/.dotfiles/`.

| Usage | Effect |
|-------|--------|
| `dotfiles-sync` | Auto-stage all tracked dirs, commit with timestamp, push |
| `dotfiles-sync -c "message"` | Same but with a custom commit message |
| `dotfiles-sync -a <file\|dir>` | Start tracking a new file or directory |
| `dotfiles-sync -s` | Show working tree status |
| `dotfiles-sync -l [n]` | Show last n commits (default 10) |

Auto-staged directories (committed on every sync):

```
~/notes/   ~/.vim/   ~/.config/i3/   ~/.config/i3status/
~/.config/polybar/   ~/.config/rofi/   ~/.config/ranger/
```

> **Known bug:** The no-argument path uses `DATE` (uppercase) instead of `date`. The timestamp in auto-commits will fail silently — the commit still happens but with a broken date string in the message. The `-c` flag uses `date` (lowercase) correctly.

---

### `notes`

Unified note management script. All notes live in `~/notes/` and use `.md` extension — omit it in all arguments.

| Usage | Effect |
|-------|--------|
| `notes` | fzf picker → view selected note |
| `notes <name>` | View a specific note |
| `notes -n <name>` | Create or edit a note in vim |
| `notes -d [name]` | Delete a note (fzf picker if no name given) |
| `notes -s` | Commit and push `~/notes/` to GitHub |

- View renders `.md` files with `glow` if available, falls back to `less`.
- Delete prompts for confirmation — accepts `y`, `Y`, `yes`, `YES`, anything else cancels.
- `-s` only commits `~/notes/` — use `dotfiles-sync` for full dotfiles push.

---

## Verify after setup

- [ ] `which dotfiles-sync` returns `~/bin/dotfiles-sync`
- [ ] `which notes` returns `~/bin/notes`
- [ ] `dotfiles-sync -s` shows repo status without errors
- [ ] `notes -n test` opens vim at `~/notes/test.md`
- [ ] `notes` opens fzf picker (requires `fzf`)
- [ ] `notes` renders markdown with glow (requires `glow`)
- [ ] `notes -d` prompts before removing a file
- [ ] `notes -s` commits and pushes to GitHub
