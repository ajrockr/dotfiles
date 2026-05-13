# Desktop Setup Replication Guide

Replicating the current Arch + i3 + polybar + ranger setup onto a new desktop machine using the bare dotfiles repo at `git@github.com:ajrockr/dotfiles.git`.

---

## Step 1 — Before leaving this machine: export package lists

The `notes/packages.md` is incomplete. Generate the real lists and sync them:

```bash
pacman -Qe > ~/packages-$(hostname).txt
pacman -Qqem > ~/aur-packages-$(hostname).txt
dotfiles-sync -a ~/packages-$(hostname).txt
dotfiles-sync -a ~/aur-packages-$(hostname).txt
dotfiles-sync -c "add full package lists"
```

Make sure all configs are synced too:

```bash
dotfiles-sync
```

---

## Step 2 — Install base Arch on the Desktop

Follow the standard Arch install process. Once you have a working base system with `sudo` and networking, continue below.

> **Note:** The desktop will not need these laptop/ASUS-specific packages:
> - `asus-touchpad-numpad-driver`
> - `supergfxctl` (ASUS hybrid GPU switcher)
> - `libinput-gestures` (touchpad gestures)

---

## Step 3 — Clone the dotfiles repo

```bash
# Install git and openssh
sudo pacman -S git openssh

# Generate SSH key and add to GitHub
ssh-keygen -t ed25519 -C "anjorizz@gmail.com"
cat ~/.ssh/id_ed25519.pub  # paste this into GitHub → Settings → SSH Keys

# Clone as bare repo
git clone --bare git@github.com:ajrockr/dotfiles.git ~/.dotfiles

# Define the dotfiles alias temporarily
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Suppress untracked file noise
dotfiles config --local status.showUntrackedFiles no

# Checkout all tracked config files
dotfiles checkout
```

> If checkout warns about conflicts, back up the conflicting files first:
> ```bash
> mkdir -p ~/.config-backup && dotfiles checkout 2>&1 | grep "^\t" | awk '{print $1}' | xargs -I{} mv {} ~/.config-backup/{}
> dotfiles checkout
> ```

---

## Step 4 — Install packages

```bash
# Install paru (AUR helper)
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd ~

# Install official repo packages from the exported list
pacman -Qnq < ~/packages-<hostname>.txt | sudo pacman -S --needed -

# Install AUR packages
cat ~/aur-packages-<hostname>.txt | paru -S --needed -
```

### GPU driver — verify before rebooting into X

Current setup uses `nvidia-open-dkms`. If the desktop has a different GPU:

| GPU          | Package                        |
|--------------|-------------------------------|
| NVIDIA       | `nvidia-open-dkms` (current)  |
| AMD          | `mesa`, `xf86-video-amdgpu`   |
| Intel        | `mesa`, `xf86-video-intel`    |

---

## Step 5 — Post-install

```bash
# Source bashrc to load the dotfiles alias and PATH
source ~/.bashrc

# Enable services
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth   # if applicable
```

`~/wallpapers/` is tracked in the dotfiles repo — both `trees.jpg` and `sebastian-unrau-sp-p7uuT0tw-unsplash.jpg` are restored automatically by `dotfiles checkout`. No manual copy needed.

The `.bash_profile` already handles starting i3 via `xinit i3` on TTY1 — no display manager configuration needed.

---

## Tracked config locations (for reference)

| Tool       | Config file                                    |
|------------|------------------------------------------------|
| i3         | `~/.config/i3/config`                          |
| Polybar    | `~/.config/polybar/neon.ini`, `config.ini`     |
| Rofi       | `~/.config/rofi/neon.rasi`                     |
| Ranger     | `~/.config/ranger/rc.conf`, `colorschemes/`    |
| Vim        | `~/.vimrc`, `~/.vim/colors/neon.vim`           |
| X          | `~/.Xresources`                                |
| Shell      | `~/.bashrc`, `~/.bash_profile`                 |
| Scripts    | `~/bin/`                                       |
| Wallpapers | `~/wallpapers/`                                |

---

## Things to verify after first boot into i3

- [ ] Fonts rendering correctly (JetBrainsMono Nerd Font — `ttf-jetbrains-mono-nerd`)
- [ ] Polybar launching (`~/config/polybar/launch.sh`)
- [ ] Rofi launcher working (`neon.rasi` theme)
- [ ] Ranger colorscheme (`neon` — custom in `colorschemes/`)
- [ ] Wallpaper loading via feh
- [ ] Audio (PipeWire — `pipewire`, `pipewire-pulse`, `wireplumber`)
- [ ] Nerd Font icons in polybar (`otf-font-awesome`)
