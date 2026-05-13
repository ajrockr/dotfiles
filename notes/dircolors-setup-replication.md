# .dircolors Setup Replication Guide

Custom `ls` color config at `~/.dircolors`. Sets `LS_COLORS` for GNU `ls --color=auto`.

---

## Replication steps (on the new machine)

`dotfiles checkout` will restore the file. `.bashrc` loads it automatically via:

```bash
[ -f ~/.dircolors ] && eval "$(dircolors ~/.dircolors)"
```

No additional packages needed. `dircolors` ships with `coreutils` which is always present.

---

## Config summary

### Key customization

Only one value differs from the system default — directories use a custom 256-color purple instead of standard bold blue:

| Type | Code | Appearance |
|------|------|------------|
| `DIR` | `01;38;5;183` | Bold, 256-color purple (`#afafff` approx) |

Everything else uses standard 8-color ANSI codes.

### File type colors

| Type | Code | Appearance |
|------|------|------------|
| `DIR` | `01;38;5;183` | Bold purple (custom) |
| `LINK` | `01;36` | Bold cyan |
| `EXEC` | `01;32` | Bold green |
| `FIFO` | `40;33` | Yellow on black background |
| `SOCK` | `01;35` | Bold magenta |
| `DOOR` | `01;35` | Bold magenta |
| `BLK` | `40;33;01` | Bold yellow on black |
| `CHR` | `40;33;01` | Bold yellow on black |
| `ORPHAN` | `40;31;01` | Bold red on black (broken symlink) |
| `SETUID` | `37;41` | White on red background |
| `SETGID` | `30;43` | Black on yellow background |
| `STICKY` | `37;44` | White on blue background |
| `OTHER_WRITABLE` | `34;42` | Blue on green background |
| `STICKY_OTHER_WRITABLE` | `30;42` | Black on green background |

### Extension colors

| Category | Extensions | Code | Appearance |
|----------|-----------|------|------------|
| Archives | `.tar` `.gz` `.zip` `.xz` `.bz2` `.zst` `.rar` `.deb` `.rpm` and ~30 more | `01;31` | Bold red |
| Images / video | `.png` `.jpg` `.gif` `.mkv` `.mp4` `.svg` `.webp` and ~40 more | `01;35` | Bold magenta |
| Audio | `.mp3` `.flac` `.ogg` `.wav` `.opus` `.aac` and ~10 more | `00;36` | Cyan |
| Backups / temp | `.bak` `.tmp` `.swp` `.orig` `.old` `*~` and ~15 more | `00;90` | Dark grey |

---

## Verify after setup

- [ ] `.dircolors` is tracked: `dotfiles-sync -s` shows no untracked changes for it
- [ ] `.bashrc` contains the `dircolors` eval line
- [ ] `ls` shows directories in purple (not the default bold blue)
- [ ] Archive files appear bold red in `ls` output
- [ ] Backup/temp files appear dark grey
