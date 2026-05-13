# ~/bin Scripts Replication Guide

Personal scripts tracked at `~/bin/`. All are on `PATH` via `.bashrc` (`$HOME/bin` prepended).

---

## Tracked files

| Script | Purpose |
|--------|---------|
| `~/bin/dotfiles-sync` | Commit and push dotfiles to GitHub |
| `~/bin/make-note` | Create or edit a note in `~/notes/` |
| `~/bin/view-note` | View a note with glow (or less as fallback) |
| `~/bin/list-notes` | List all notes in `~/notes/` |
| `~/bin/delete-note` | Interactively delete a note |

---

## Required packages

```bash
sudo pacman -S git fzf glow
```

> `fzf` is used by `view-note` and `delete-note` for interactive fuzzy selection when no filename is given. `glow` renders markdown notes in the terminal — `view-note` falls back to `less` if it's not installed.

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

### `make-note`

```bash
make-note <filename>
```

Opens `~/notes/<filename>.md` in vim. Creates `~/notes/` if it doesn't exist. No `.md` extension needed in the argument — it's appended automatically.

---

### `view-note`

```bash
view-note [filename]   # filename without .md extension
view-note              # fuzzy-pick from all notes with fzf
```

Renders `.md` files with `glow` if available, otherwise falls back to `less`. Non-markdown files always use `less`.

---

### `list-notes`

```bash
list-notes
```

Prints all files in `~/notes/` sorted alphabetically. No arguments.

---

### `delete-note`

```bash
delete-note [filename]   # filename without .md extension
delete-note              # fuzzy-pick from all notes with fzf
```

Prompts for confirmation before deleting. Accepts `y`, `Y`, `yes`, or `YES` — anything else cancels.

---

## Verify after setup

- [ ] `which dotfiles-sync` returns `~/bin/dotfiles-sync`
- [ ] `dotfiles-sync -s` shows repo status without errors
- [ ] `make-note test` opens vim at `~/notes/test.md`
- [ ] `list-notes` prints the notes directory contents
- [ ] `view-note` opens fzf picker (requires `fzf`)
- [ ] `view-note` renders markdown with glow (requires `glow`)
- [ ] `delete-note` prompts before removing a file
