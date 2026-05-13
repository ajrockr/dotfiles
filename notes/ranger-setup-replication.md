# Ranger Setup Replication Guide

Replicating the current ranger config on a new machine. Config is tracked at `~/.config/ranger/`.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.config/ranger/rc.conf` | Main config — settings and options |
| `~/.config/ranger/colorschemes/neon.py` | Custom neon colorscheme |
| `~/.config/ranger/colorschemes/__init__.py` | Empty package marker (required for Python import) |

---

## Required packages

```bash
sudo pacman -S ranger ueberzugpp
```

> `ueberzugpp` is required for image previews (`preview_images_method ueberzug`). Without it, ranger will start but image previews will silently fail.

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, all files are in place. Verify:

```bash
ls ~/.config/ranger/rc.conf
ls ~/.config/ranger/colorschemes/neon.py
```

---

## Step 2 — Generate default config (first run only)

Ranger copies its full default config into `~/.config/ranger/` on first run. Since `rc.conf` is tracked and minimal (only overrides), run ranger once to generate the remaining default files, then verify the tracked `rc.conf` is not overwritten:

```bash
ranger --copy-config=scope   # generates scope.sh for previews
```

Do **not** run `ranger --copy-config=rc` — that would overwrite the tracked `rc.conf`.

---

## Config summary (`rc.conf`)

| Setting | Value | Effect |
|---------|-------|--------|
| `preview_images` | `true` | Enable image previews in the pane |
| `preview_images_method` | `ueberzug` | Use ueberzugpp for rendering images |
| `colorscheme` | `neon` | Load `~/.config/ranger/colorschemes/neon.py` |
| `draw_borders` | `both` | Draw borders around all panes |
| `padding_right` | `false` | No padding in the rightmost preview pane |

---

## Neon colorscheme (`neon.py`)

Custom Python colorscheme. Color assignments by file/context type:

| Context | Color | Attribute |
|---------|-------|-----------|
| Directories | blue | bold |
| Executables | green | bold |
| Images | yellow | — |
| Other media | magenta | — |
| Archives/containers | red | bold |
| Symlinks (good) | cyan | — |
| Symlinks (broken) | magenta | — |
| Sockets | magenta | bold |
| FIFOs / devices | yellow | bold |
| Cut files | red | bold |
| Copied files | yellow | bold |
| Marked files | yellow | bold |
| Tagged files | red | bold |
| Progress bar | blue | — |

### VCS status colors (in browser)

| State | Color |
|-------|-------|
| Untracked | magenta |
| Changed / unknown / deleted | red |
| Staged / new file | green |
| Renamed | yellow |
| Ignored | default |

### VCS remote colors (in statusbar)

| State | Color |
|-------|-------|
| In sync | green |
| Behind | red |
| Ahead | blue |
| Diverged | magenta |

---

## Verify after setup

- [ ] `ranger` launches without errors
- [ ] Borders visible around panes (`draw_borders both`)
- [ ] Directories appear bold blue
- [ ] Image preview renders in right pane (requires `ueberzugpp` running)
- [ ] Colorscheme name `neon` resolves without import errors
