# Vim Setup Replication Guide

Replicating the current Vim config on a new machine. All tracked files are in the dotfiles repo — this covers the bootstrap steps that can't be inferred from the files alone.

---

## Tracked files

| File | Purpose |
|------|---------|
| `~/.vimrc` | Main config — settings, mappings, sources plugins.vim |
| `~/.vim/plugins.vim` | Vundle plugin declarations |
| `~/.vim/colors/neon.vim` | Custom neon colorscheme (dark, neon blue/pink/green palette) |

---

## Step 1 — Install Vim

```bash
sudo pacman -S vim
```

---

## Step 2 — Restore dotfiles

If you've already run `dotfiles checkout` from the desktop setup guide, your `.vimrc`, `plugins.vim`, and `neon.vim` are already in place. Verify:

```bash
ls ~/.vimrc ~/.vim/plugins.vim ~/.vim/colors/neon.vim
```

---

## Step 3 — Bootstrap Vundle

Vundle is the plugin manager. The repo lives at `~/.vim/bundle/Vundle.vim` — it's a git submodule and must be cloned manually on a fresh machine:

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Then install all declared plugins from inside Vim:

```bash
vim +PluginInstall +qall
```

---

## Step 4 — Verify colorscheme

The `neon` colorscheme requires `termguicolors` (already set in `.vimrc`) and every `hi` line must have explicit `ctermfg`/`ctermbg`/`cterm=` values — omitting any of these causes E254 errors even with `termguicolors` set.

Open Vim and confirm no errors:

```bash
vim --noplugin -c "colorscheme neon" -c "quit"
```

---

## Config summary

### `.vimrc` settings

| Setting | Value | Effect |
|---------|-------|--------|
| `mapleader` | `,` | Prefix for custom mappings |
| `tabstop` / `shiftwidth` | 4 | 4-space indentation |
| `expandtab` | on | Spaces, not tabs |
| `hlsearch` + `incsearch` | on | Highlighted incremental search |
| `set number` | on | Line numbers |
| `termguicolors` | on | 24-bit color |
| `colorscheme` | `neon` | Custom dark neon theme |

### Key mappings

| Mapping | Action |
|---------|--------|
| `,<space>` | Clear search highlights (`:nohlsearch`) |

### Auto commands

- `.vimrc` is re-sourced automatically on save
- `.zshrc` is re-sourced automatically on save

---

## Currently installed plugins

Only Vundle itself is declared in `plugins.vim` — it manages itself. No additional plugins are installed yet. To add one:

```vim
" In ~/.vim/plugins.vim, between vundle#begin() and vundle#end():
Plugin 'tpope/vim-surround'
```

Then run `:PluginInstall` inside Vim.

---

## Neon colorscheme palette (for reference)

| Role | Hex | cterm |
|------|-----|-------|
| Background | `#0f0f0f` | 233 |
| Foreground | `#c0c0c0` | 251 |
| Blue (functions, constants) | `#00aaff` | 39 |
| Red (keywords, statements) | `#ff2244` | 197 |
| Green (strings) | `#33cc66` | 83 |
| Yellow (search, todo) | `#ffcc00` | 220 |
| Cyan (numbers, preproc) | `#00ccff` | 45 |
| Purple (spell rare) | `#9933ff` | 135 |
