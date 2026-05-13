# .bashrc / .bash_profile Setup Replication Guide

Replicating the shell config on a new machine. Both files are tracked in the dotfiles repo.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.bashrc` | Interactive shell config — aliases, prompt, PATH, ssh-agent |
| `~/.bash_profile` | Login shell — sources `.bashrc`, auto-starts i3 on TTY1 |

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, both files are in place. Verify:

```bash
ls ~/.bashrc ~/.bash_profile
```

---

## `.bashrc` summary

### Aliases

| Alias | Command | Effect |
|-------|---------|--------|
| `ls` | `ls --color=auto` | Colorized directory listing |
| `grep` | `grep --color=auto` | Colorized grep output |
| `dotfiles` | `/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME` | Manage dotfiles bare repo |

### Prompt

```
[user@hostname dir]$
```

Standard `PS1` — username, hostname, current directory (basename only).

### PATH additions

| Path | Purpose |
|------|---------|
| `$HOME/bin` | Personal scripts (dotfiles-sync, list-notes, make-note, etc.) |
| `$HOME/.local/bin` | User-installed binaries (pip, cargo installs, etc.) |

Both are prepended, so they take precedence over system binaries.

### SSH agent

```bash
eval "$(ssh-agent -s)" &>/dev/null
ssh-add ~/.ssh/id_ed25519 2>/dev/null
```

Starts `ssh-agent` silently on every interactive shell and adds the `id_ed25519` key. On a fresh machine, generate the key first:

```bash
ssh-keygen -t ed25519 -C "anjorizz@gmail.com"
```

Then add the public key to GitHub before cloning the dotfiles repo.

> The `&>/dev/null` and `2>/dev/null` suppress output — errors (e.g. key not found) are silent. If SSH auth isn't working, run both commands manually without the redirection to see the error.

---

## `.bash_profile` summary

```bash
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    xinit i3
fi
```

- Sources `.bashrc` so login shells get the same config as interactive shells.
- Auto-starts i3 via `xinit` when logging in on **TTY1 only** (`$XDG_VTNR -eq 1`). Logging in on TTY2+ drops to a plain shell.

---

## Required packages

```bash
sudo pacman -S openssh xorg-xinit
```

---

## Verify after setup

- [ ] `dotfiles status` works (bare repo alias resolves)
- [ ] `ls` and `grep` output is colorized
- [ ] `~/bin` scripts are on PATH (`which dotfiles-sync` returns `~/bin/dotfiles-sync`)
- [ ] SSH agent starts silently (`ssh-add -l` shows the key after login)
- [ ] Logging into TTY1 auto-launches i3
- [ ] Logging into TTY2 drops to a shell (no X start)
