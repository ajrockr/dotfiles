# i3 Setup Replication Guide

Replicating the current i3-wm config on a new machine. Config is tracked at `~/.config/i3/config`.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.config/i3/config` | Main i3 config — keybindings, gaps, colors, autostart |

---

## Required packages

```bash
sudo pacman -S i3-wm feh dex xss-lock i3lock rofi urxvt \
               network-manager-applet gnome-keyring \
               ttf-jetbrains-mono-nerd
```

> `dex` handles XDG autostart entries. `xss-lock` locks the screen on suspend via i3lock.

---

## Step 1 — Restore dotfiles

If you've already run `dotfiles checkout`, the config is in place. Verify:

```bash
ls ~/.config/i3/config
```

---

## Step 2 — Remove the i3-config-wizard exec line

The bottom of `~/.config/i3/config` has this line left over from the default template:

```
exec i3-config-wizard
```

This will launch the wizard on first start. Since the config is already restored from dotfiles, **remove or comment it out** before starting i3:

```bash
sed -i 's/^exec i3-config-wizard/#exec i3-config-wizard/' ~/.config/i3/config
```

---

## Step 3 — Wallpaper

The config expects `~/wallpapers/trees.jpg`. Copy or symlink the wallpaper before starting i3, or update the path:

```bash
# Option A: copy wallpaper from old machine
# Option B: edit the feh line in config
exec_always --no-startup-id feh --bg-fill ~/wallpapers/trees.jpg
```

---

## Step 4 — Start i3

`.bash_profile` launches i3 automatically via `xinit i3` on TTY1. Log in on TTY1 and it will start.

---

## Config summary

### Core settings

| Setting | Value |
|---------|-------|
| Modifier | `Mod1` (Alt) |
| Terminal | `urxvt` |
| Launcher | `rofi -show drun -show-icons true -theme neon` |
| Font | JetBrainsMono Nerd Font 12 |
| Inner gaps | 10px |
| Outer gaps | 5px |
| Border | pixel 2 |
| Edge borders | hidden when only one window (smart) |

### Direction keys (vi-style)

| Variable | Key | Direction |
|----------|-----|-----------|
| `$left` | `j` | left |
| `$down` | `k` | down |
| `$up` | `l` | up |
| `$right` | `;` | right |

### Key bindings

| Binding | Action |
|---------|--------|
| `Alt+Return` | Open urxvt terminal |
| `Alt+d` | Launch rofi (app launcher) |
| `Alt+Shift+q` | Kill focused window |
| `Alt+h` | Split horizontal |
| `Alt+v` | Split vertical |
| `Alt+f` | Toggle fullscreen |
| `Alt+s` | Stacking layout |
| `Alt+w` | Tabbed layout |
| `Alt+e` | Toggle split layout |
| `Alt+Shift+space` | Toggle floating |
| `Alt+space` | Toggle focus tiling/floating |
| `Alt+a` | Focus parent |
| `Alt+minus` | Show scratchpad |
| `Alt+Shift+minus` | Move to scratchpad |
| `Alt+r` | Enter resize mode |
| `Alt+Shift+c` | Reload config |
| `Alt+Shift+r` | Restart i3 in-place |
| `Alt+Shift+e` | Exit i3 |
| `Alt+1`–`0` | Switch to workspace 1–10 |
| `Alt+Shift+1`–`0` | Move window to workspace 1–10 |
| `XF86AudioRaiseVolume` | Volume +10% |
| `XF86AudioLowerVolume` | Volume -10% |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle mic mute |

### Autostart

| Command | Purpose |
|---------|---------|
| `dex --autostart --environment i3` | XDG autostart entries |
| `nm-applet` | Network Manager tray icon |
| `gnome-keyring-daemon` | SSH/secrets keyring |
| `xss-lock -- i3lock` | Lock screen on suspend |
| `feh --bg-fill ~/wallpapers/trees.jpg` | Set wallpaper |
| `~/.config/polybar/launch.sh` | Launch polybar |

### Neon color palette (window borders)

| Variable | Hex | Usage |
|----------|-----|-------|
| `$bg` | `#0f0f0f` | Unfocused background |
| `$bg1` | `#1a1a1a` | Inactive/urgent background |
| `$surface` | `#222222` | Focused background |
| `$blue` | `#00aaff` | Focused border/indicator |
| `$red` | `#ff2244` | Urgent border |
| `$grey` | `#3d3d3d` | Inactive border |

---

## Desktop-specific note

The config references `nm-applet` twice — this is a harmless duplicate from the default template but only one instance is needed.

---

## Verify after first boot

- [ ] Gaps rendering (requires `i3-wm` — note: `i3-gaps` is now merged into `i3-wm` since v4.22)
- [ ] Rofi launcher opens with neon theme (`Alt+d`)
- [ ] urxvt terminal opens (`Alt+Return`)
- [ ] Wallpaper loads via feh
- [ ] Polybar appears at top
- [ ] Screen locks on suspend (`xss-lock` + `i3lock`)
