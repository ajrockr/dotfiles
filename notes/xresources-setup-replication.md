# .Xresources Setup Replication Guide

Replicating the urxvt terminal config on a new machine. Config is tracked at `~/.Xresources`.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.Xresources` | urxvt appearance, fonts, colors, scrollback, perl extensions |

---

## Required packages

```bash
sudo pacman -S rxvt-unicode ttf-jetbrains-mono-nerd
```

> The `resize-font` perl extension (listed in `perl-ext-common`) ships with `rxvt-unicode` on Arch — no separate package needed. The `matcher` extension (URL clicking) is also included.

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, the file is in place. Verify:

```bash
ls ~/.Xresources
```

---

## Step 2 — Load the config

`.Xresources` is not loaded automatically — it must be merged into the X resource database. This happens at X startup via `.xinitrc` or `.xprofile`. Apply it manually after first login:

```bash
xrdb -merge ~/.Xresources
```

To verify it's loaded:

```bash
xrdb -query | grep URxvt
```

> **Note:** The current `~/.xinitrc` only contains `exec i3` — there is no `xrdb` call. On a fresh machine, add the merge line before the exec so it loads on every X startup:
> ```bash
> # ~/.xinitrc
> xrdb -merge ~/.Xresources
> exec i3
> ```

---

## Config summary

### Font

| Setting | Value |
|---------|-------|
| Normal | JetBrainsMono Nerd Font size 12 |
| Bold | JetBrainsMono Nerd Font bold size 12 |

### Appearance

| Setting | Value |
|---------|-------|
| Background | `#0f0f0f` |
| Foreground | `#c0c0c0` |
| Cursor color | `#00aaff` (neon blue) |
| Cursor blink | enabled |
| Default geometry | 90 columns × 26 rows |
| Internal border | 8px |
| Scrollbar | hidden |

### Scrollback

| Setting | Value |
|---------|-------|
| `saveLines` | 2000 |
| `scrollTtyOutput` | false — don't scroll to bottom on new output |
| `scrollWithBuffer` | true — scroll when buffer grows |
| `scrollTtyKeypress` | true — scroll to bottom on keypress |

### Perl extensions

| Extension | Function |
|-----------|---------|
| `default` | Standard urxvt defaults |
| `matcher` | Makes URLs clickable (left-click opens in Firefox) |
| `resize-font` | Runtime font size adjustment |

URL launcher is set to `/usr/bin/firefox`.

### Neon Dark 16-color palette

| Index | Normal | Bright |
|-------|--------|--------|
| Black (0/8) | `#0f0f0f` | `#3d3d3d` |
| Red (1/9) | `#cc1133` | `#ff2244` |
| Green (2/10) | `#229944` | `#33cc66` |
| Yellow (3/11) | `#cc9900` | `#ffcc00` |
| Blue (4/12) | `#0077cc` | `#00aaff` |
| Magenta (5/13) | `#7722cc` | `#9933ff` |
| Cyan (6/14) | `#007799` | `#00ccff` |
| White (7/15) | `#888888` | `#f0f0f0` |

---

## Verify after setup

- [ ] `xrdb -query | grep URxvt` returns entries
- [ ] urxvt opens with dark background and JetBrainsMono font
- [ ] Cursor is neon blue and blinking
- [ ] URLs in terminal are clickable (left-click)
- [ ] Font resize works (typically `Ctrl+Alt+/` and `Ctrl+Alt+-` with resize-font)
