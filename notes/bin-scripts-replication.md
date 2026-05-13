# ~/bin Scripts Replication Guide

Personal scripts tracked at `~/bin/`. All are on `PATH` via `.bashrc` (`$HOME/bin` prepended).

---

## Tracked files

| Script | Purpose |
|--------|---------|
| `~/bin/arch-setup` | Full system bootstrap — packages, dotfiles, services |
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

### `arch-setup`

Full system bootstrap script. Run on a fresh Arch install to replicate the entire setup.
On a new machine before dotfiles are checked out, download it directly:

```bash
curl -o arch-setup https://raw.githubusercontent.com/ajrockr/dotfiles/main/bin/arch-setup
chmod +x arch-setup && ./arch-setup
```

What it does, in order:

1. Prompts for CPU (intel-ucode / amd-ucode) and GPU (NVIDIA / AMD / Intel) drivers
2. Updates the system via `pacman -Syu`
3. Bootstraps `paru` (AUR helper)
4. Installs all official and AUR packages
5. Generates SSH key, prints the public key, waits for GitHub confirmation
6. Clones the dotfiles bare repo and checks out all configs
7. Backs up any conflicting files with a timestamp
8. Marks `~/bin/` scripts executable
9. Fixes `.xinitrc` (adds `xrdb -merge ~/.Xresources` before `exec i3`)
10. Comments out `i3-config-wizard` in i3 config
11. Bootstraps Vundle and installs vim plugins
12. Enables systemd services (NetworkManager, bluetooth, lightdm, cups, libvirtd, ufw)

> After running, copy `~/wallpapers/trees.jpg` from the old machine or update the `feh` line in `~/.config/i3/config`.

---

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

- [ ] `which arch-setup` returns `~/bin/arch-setup`
- [ ] `which dotfiles-sync` returns `~/bin/dotfiles-sync`
- [ ] `which notes` returns `~/bin/notes`
- [ ] `dotfiles-sync -s` shows repo status without errors
- [ ] `notes -n test` opens vim at `~/notes/test.md`
- [ ] `notes` opens fzf picker (requires `fzf`)
- [ ] `notes` renders markdown with glow (requires `glow`)
- [ ] `notes -d` prompts before removing a file
- [ ] `notes -s` commits and pushes to GitHub
