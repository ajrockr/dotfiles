# Polybar Setup Replication Guide

Replicating the current polybar config on a new machine. Config is tracked at `~/.config/polybar/`.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.config/polybar/config.ini` | Main bar config — modules, layout, fonts |
| `~/.config/polybar/neon.ini` | Neon color palette (included by config.ini) |
| `~/.config/polybar/launch.sh` | Launch script called by i3 on startup |

---

## Required packages

```bash
sudo pacman -S polybar ttf-jetbrains-mono-nerd otf-font-awesome \
               pipewire pipewire-pulse  # for pulseaudio module
```

For the wlan click action (`iwgtk`):

```bash
paru -S iwgtk
```

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, all three files are in place. Make `launch.sh` executable:

```bash
chmod +x ~/.config/polybar/launch.sh
```

---

## Step 2 — Desktop adjustments

The config was written for a laptop. On a desktop, make these changes in `config.ini`:

### Remove the battery module

The `battery` module polls `BAT0` — desktops have no battery. Remove it from `modules-right`:

```ini
; Before:
modules-right = pulseaudio memory cpu wlan eth battery date

; After:
modules-right = pulseaudio memory cpu wlan eth date
```

### Adjust network modules

If the desktop is ethernet-only, remove `wlan` from `modules-right` as well:

```ini
modules-right = pulseaudio memory cpu eth date
```

If the desktop has both interfaces, keep both — polybar will show only the connected one.

---

## Config summary

### Bar (`mybar`)

| Setting | Value |
|---------|-------|
| Width | 100% |
| Height | 26pt |
| Radius | 0 (no rounded corners) |
| Font | JetBrainsMono Nerd Font size 10 |
| WM restack | i3 |
| IPC | enabled |

### Modules

| Position | Modules |
|----------|---------|
| Left | `xworkspaces` `xwindow` |
| Right | `pulseaudio` `memory` `cpu` `wlan` `eth` `battery` `date` |

### Module details

| Module | Type | Notes |
|--------|------|-------|
| `xworkspaces` | internal/xworkspaces | Active workspace underlined in red, highlighted in surface1 |
| `xwindow` | internal/xwindow | Focused window title, truncated at 60 chars |
| `pulseaudio` | internal/pulseaudio | Prefixed `VOL`, shows percentage |
| `memory` | internal/memory | Prefixed `RAM`, 2s interval |
| `cpu` | internal/cpu | Prefixed `CPU`, 2s interval |
| `wlan` | internal/network wireless | Shows ESSID + IP, click opens `iwgtk` |
| `eth` | internal/network wired | Shows `Conn` when connected |
| `battery` | internal/battery | Polls `BAT0` — **remove on desktop** |
| `date` | internal/date | Format: `MM-DD HH:MM AM/PM` |

### Neon palette (`neon.ini`)

The palette file maps catppuccin variable names to neon dark values so `config.ini` can reference them by semantic name.

| Variable | Hex | Role |
|----------|-----|------|
| `base` | `#0f0f0f` | Bar background |
| `text` | `#c0c0c0` | Default foreground |
| `rosewater` / `blue` | `#00aaff` | Module prefixes, active workspace |
| `red` | `#ff2244` | Active workspace underline, urgent |
| `green` | `#33cc66` | Accent |
| `yellow` | `#ffcc00` | Accent |
| `teal` | `#0077cc` | Date label |
| `overlay0` | `#3d3d3d` | Border, separator, empty workspaces |
| `surface1` | `#222222` | Active workspace background |
| `disabled` | `#3d3d3d` | Disconnected/unmounted labels |

---

## How launch.sh works

```bash
killall -q polybar                              # kill any running instance
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown
```

Logs are written to `/tmp/polybar.log`. If polybar fails to start, check there first:

```bash
tail -f /tmp/polybar.log
```

---

## Verify after first boot

- [ ] Bar appears at top of screen
- [ ] Workspace numbers show and update on workspace switch
- [ ] `VOL`, `RAM`, `CPU` modules display values
- [ ] Date/time displays correctly
- [ ] Network module shows connected interface
- [ ] Battery module absent (desktop) or showing charge (laptop)
- [ ] Font icons rendering (requires `otf-font-awesome` + `ttf-jetbrains-mono-nerd`)
