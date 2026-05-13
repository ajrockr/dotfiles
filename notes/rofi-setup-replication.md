# Rofi Setup Replication Guide

Replicating the current rofi config on a new machine. Config is tracked at `~/.config/rofi/`.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.config/rofi/neon.rasi` | Active neon theme — used by i3 launcher binding |
| `~/.config/rofi/globals.rasi` | Unused legacy theme (kept for reference) |
| `~/.config/rofi/catppuccin-default.rasi` | Alternate theme (not active) |
| `~/.config/rofi/catppuccin-frappe.rasi` | Alternate theme (not active) |
| `~/.config/rofi/spotlight.rasi` | Alternate theme (not active) |

---

## Required packages

```bash
sudo pacman -S rofi ttf-jetbrains-mono-nerd papirus-icon-theme
```

> `papirus-icon-theme` provides the app icons shown in the launcher (`-show-icons true`). Any icon theme works — update if you prefer a different one.

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, all theme files are in place. Verify:

```bash
ls ~/.config/rofi/neon.rasi
```

---

## How rofi is launched

Defined in `~/.config/i3/config`:

```bash
rofi -show drun -show-icons true -theme neon
```

Triggered by `Alt+d`. The `-theme neon` flag resolves to `~/.config/rofi/neon.rasi`.

---

## Neon theme summary (`neon.rasi`)

### Palette

| Variable | Hex | Usage |
|----------|-----|-------|
| `@bg` | `#0f0f0f` | Window background |
| `@bg1` | `#1a1a1a` | Input bar background |
| `@bg2` | `#222222` | Selected item background, input border |
| `@fg` | `#c0c0c0` | Default text |
| `@fg-dim` | `#666666` | Placeholder text |
| `@blue` | `#00aaff` | Window border, prompt text |
| `@red` | `#ff2244` | Selected item left border accent |
| `@white` | `#f0f0f0` | Selected item text |

### Layout

| Element | Details |
|---------|---------|
| Window | 520px wide, 2px solid blue border, 4px radius |
| Input bar | `#1a1a1a` background, `10px 14px` padding, bottom border separator |
| Prompt | Blue, bold, 8px right padding |
| Placeholder | "Search apps...", dimmed (`@fg-dim`) |
| List | 8 lines, 1 column, no scrollbar |
| Items | `7px 14px` padding, 10px icon gap |
| Selected item | `@bg2` background, white text, 2px left red border accent |

### Font

`JetBrainsMono Nerd Font 11` — prompt uses the Bold variant.

---

## Switching themes

To try an alternate theme without editing i3 config:

```bash
rofi -show drun -show-icons true -theme catppuccin-frappe
rofi -show drun -show-icons true -theme spotlight
```

To make a theme permanent, update the `$search` variable in `~/.config/i3/config`:

```bash
set $search "rofi -show drun -show-icons true -theme <name>"
```

---

## Verify after setup

- [ ] `Alt+d` opens rofi with neon theme
- [ ] Blue border visible around window
- [ ] App icons appear next to entries (requires icon theme)
- [ ] Selected item has red left-border accent
- [ ] Font renders correctly (JetBrainsMono Nerd Font)
- [ ] Prompt text appears in blue
