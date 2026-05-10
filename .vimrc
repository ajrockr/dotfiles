" ------------------ GENERAL ------------------
set nocompatible              						" be iMproved, required
set t_CO=256
so ~/.vim/plugins.vim							"Load plugins.

set termguicolors
syntax on
"colorscheme unokai
"colorscheme catppuccin
colorscheme neon

set backspace=indent,eol,start						"Make backspace delete indentation, whitespace ect
let mapleader= ','							"Comma should be the leader

" ------------------ MAPPINGS ------------------
nmap <Leader><space>	:nohlsearch<cr>					"Hide search results.


" ------------------ SEARCH ------------------
set hlsearch
set incsearch
" ------------------ AUTO COMMANDS ------------------
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %					"Source the .vimrc every time we save it
	autocmd BufWritePost .zshrc source %					"Source the .zshrc every time we save it
augroup END

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number
