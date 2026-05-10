highlight clear
if exists('syntax_on') | syntax reset | endif
let g:colors_name = 'neon'
set background=dark

" Palette (gui hex → cterm 256 approx)
"  #0f0f0f → 233   #1a1a1a → 234   #222222 → 235   #3d3d3d → 237
"  #555555 → 240   #666666 → 241   #c0c0c0 → 251   #f0f0f0 → 255
"  #ff2244 → 197   #cc1133 → 160   #00aaff → 39    #0077cc → 26
"  #00ccff → 45    #33cc66 → 83    #ffcc00 → 220   #9933ff → 135

" ── Editor chrome ─────────────────────────────────────────────────────────────
hi Normal          ctermfg=251  ctermbg=233  cterm=NONE  guifg=#c0c0c0  guibg=#0f0f0f  gui=NONE
hi NormalNC        ctermfg=251  ctermbg=233  cterm=NONE  guifg=#c0c0c0  guibg=#0f0f0f  gui=NONE

hi LineNr          ctermfg=237  ctermbg=233  cterm=NONE  guifg=#3d3d3d  guibg=#0f0f0f  gui=NONE
hi CursorLine      ctermfg=NONE ctermbg=234  cterm=NONE  guifg=NONE     guibg=#1a1a1a  gui=NONE
hi CursorLineNr    ctermfg=39   ctermbg=234  cterm=bold  guifg=#00aaff  guibg=#1a1a1a  gui=bold
hi ColorColumn     ctermfg=NONE ctermbg=234  cterm=NONE  guifg=NONE     guibg=#1a1a1a  gui=NONE
hi SignColumn      ctermfg=237  ctermbg=233  cterm=NONE  guifg=#3d3d3d  guibg=#0f0f0f  gui=NONE

hi VertSplit       ctermfg=235  ctermbg=235  cterm=NONE  guifg=#222222  guibg=#222222  gui=NONE
hi WinSeparator    ctermfg=235  ctermbg=235  cterm=NONE  guifg=#222222  guibg=#222222  gui=NONE

hi StatusLine      ctermfg=251  ctermbg=235  cterm=NONE  guifg=#c0c0c0  guibg=#222222  gui=NONE
hi StatusLineNC    ctermfg=241  ctermbg=234  cterm=NONE  guifg=#666666  guibg=#1a1a1a  gui=NONE

hi TabLine         ctermfg=241  ctermbg=234  cterm=NONE  guifg=#666666  guibg=#1a1a1a  gui=NONE
hi TabLineSel      ctermfg=255  ctermbg=235  cterm=bold  guifg=#f0f0f0  guibg=#222222  gui=bold
hi TabLineFill     ctermfg=NONE ctermbg=234  cterm=NONE  guifg=NONE     guibg=#1a1a1a  gui=NONE

hi Folded          ctermfg=241  ctermbg=234  cterm=NONE  guifg=#666666  guibg=#1a1a1a  gui=italic
hi FoldColumn      ctermfg=237  ctermbg=233  cterm=NONE  guifg=#3d3d3d  guibg=#0f0f0f  gui=NONE

hi NonText         ctermfg=237  ctermbg=NONE cterm=NONE  guifg=#3d3d3d  guibg=NONE     gui=NONE
hi SpecialKey      ctermfg=237  ctermbg=NONE cterm=NONE  guifg=#3d3d3d  guibg=NONE     gui=NONE
hi EndOfBuffer     ctermfg=234  ctermbg=NONE cterm=NONE  guifg=#1a1a1a  guibg=NONE     gui=NONE
hi Conceal         ctermfg=241  ctermbg=NONE cterm=NONE  guifg=#666666  guibg=NONE     gui=NONE

" ── Selection / search ────────────────────────────────────────────────────────
hi Visual          ctermfg=NONE ctermbg=235  cterm=NONE  guifg=NONE     guibg=#222222  gui=NONE
hi VisualNOS       ctermfg=NONE ctermbg=235  cterm=NONE  guifg=NONE     guibg=#222222  gui=NONE
hi Search          ctermfg=233  ctermbg=220  cterm=NONE  guifg=#0f0f0f  guibg=#ffcc00  gui=NONE
hi IncSearch       ctermfg=233  ctermbg=39   cterm=bold  guifg=#0f0f0f  guibg=#00aaff  gui=bold
hi Substitute      ctermfg=233  ctermbg=197  cterm=NONE  guifg=#0f0f0f  guibg=#ff2244  gui=NONE

" ── Popup menu ────────────────────────────────────────────────────────────────
hi Pmenu           ctermfg=251  ctermbg=234  cterm=NONE  guifg=#c0c0c0  guibg=#1a1a1a  gui=NONE
hi PmenuSel        ctermfg=255  ctermbg=26   cterm=bold  guifg=#f0f0f0  guibg=#0077cc  gui=bold
hi PmenuSbar       ctermfg=NONE ctermbg=235  cterm=NONE  guifg=NONE     guibg=#222222  gui=NONE
hi PmenuThumb      ctermfg=NONE ctermbg=237  cterm=NONE  guifg=NONE     guibg=#3d3d3d  gui=NONE

" ── Messages / prompts ────────────────────────────────────────────────────────
hi ErrorMsg        ctermfg=197  ctermbg=NONE cterm=bold  guifg=#ff2244  guibg=NONE     gui=bold
hi WarningMsg      ctermfg=220  ctermbg=NONE cterm=bold  guifg=#ffcc00  guibg=NONE     gui=bold
hi ModeMsg         ctermfg=39   ctermbg=NONE cterm=bold  guifg=#00aaff  guibg=NONE     gui=bold
hi MoreMsg         ctermfg=83   ctermbg=NONE cterm=bold  guifg=#33cc66  guibg=NONE     gui=bold
hi Question        ctermfg=39   ctermbg=NONE cterm=bold  guifg=#00aaff  guibg=NONE     gui=bold

" ── Diff ──────────────────────────────────────────────────────────────────────
hi DiffAdd         ctermfg=83   ctermbg=22   cterm=NONE  guifg=#33cc66  guibg=#0d2219  gui=NONE
hi DiffDelete      ctermfg=197  ctermbg=52   cterm=NONE  guifg=#ff2244  guibg=#200a10  gui=NONE
hi DiffChange      ctermfg=39   ctermbg=17   cterm=NONE  guifg=#00aaff  guibg=#071a2e  gui=NONE
hi DiffText        ctermfg=220  ctermbg=58   cterm=bold  guifg=#ffcc00  guibg=#2a2000  gui=bold

" ── Spelling ──────────────────────────────────────────────────────────────────
hi SpellBad        ctermfg=NONE ctermbg=NONE cterm=underline  guifg=NONE  guibg=NONE  gui=undercurl  guisp=#ff2244
hi SpellCap        ctermfg=NONE ctermbg=NONE cterm=underline  guifg=NONE  guibg=NONE  gui=undercurl  guisp=#00aaff
hi SpellRare       ctermfg=NONE ctermbg=NONE cterm=underline  guifg=NONE  guibg=NONE  gui=undercurl  guisp=#9933ff
hi SpellLocal      ctermfg=NONE ctermbg=NONE cterm=underline  guifg=NONE  guibg=NONE  gui=undercurl  guisp=#ffcc00

" ── Syntax ────────────────────────────────────────────────────────────────────
hi Comment         ctermfg=240  ctermbg=NONE cterm=NONE  guifg=#555555  guibg=NONE  gui=italic
hi Todo            ctermfg=220  ctermbg=NONE cterm=bold  guifg=#ffcc00  guibg=NONE  gui=bold,italic

hi Constant        ctermfg=39   ctermbg=NONE cterm=NONE  guifg=#00aaff  guibg=NONE  gui=NONE
hi String          ctermfg=83   ctermbg=NONE cterm=NONE  guifg=#33cc66  guibg=NONE  gui=NONE
hi Character       ctermfg=83   ctermbg=NONE cterm=NONE  guifg=#33cc66  guibg=NONE  gui=NONE
hi Number          ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE
hi Float           ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE
hi Boolean         ctermfg=39   ctermbg=NONE cterm=bold  guifg=#00aaff  guibg=NONE  gui=bold

hi Identifier      ctermfg=251  ctermbg=NONE cterm=NONE  guifg=#c0c0c0  guibg=NONE  gui=NONE
hi Function        ctermfg=39   ctermbg=NONE cterm=bold  guifg=#00aaff  guibg=NONE  gui=bold

hi Statement       ctermfg=197  ctermbg=NONE cterm=NONE  guifg=#ff2244  guibg=NONE  gui=NONE
hi Conditional     ctermfg=197  ctermbg=NONE cterm=NONE  guifg=#ff2244  guibg=NONE  gui=NONE
hi Repeat          ctermfg=197  ctermbg=NONE cterm=NONE  guifg=#ff2244  guibg=NONE  gui=NONE
hi Label           ctermfg=197  ctermbg=NONE cterm=NONE  guifg=#ff2244  guibg=NONE  gui=NONE
hi Operator        ctermfg=251  ctermbg=NONE cterm=NONE  guifg=#c0c0c0  guibg=NONE  gui=NONE
hi Keyword         ctermfg=197  ctermbg=NONE cterm=NONE  guifg=#ff2244  guibg=NONE  gui=NONE
hi Exception       ctermfg=197  ctermbg=NONE cterm=bold  guifg=#ff2244  guibg=NONE  gui=bold

hi PreProc         ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE
hi Include         ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE
hi Define          ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE
hi Macro           ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE
hi PreCondit       ctermfg=45   ctermbg=NONE cterm=NONE  guifg=#00ccff  guibg=NONE  gui=NONE

hi Type            ctermfg=26   ctermbg=NONE cterm=NONE  guifg=#0077cc  guibg=NONE  gui=NONE
hi StorageClass    ctermfg=26   ctermbg=NONE cterm=NONE  guifg=#0077cc  guibg=NONE  gui=NONE
hi Structure       ctermfg=26   ctermbg=NONE cterm=NONE  guifg=#0077cc  guibg=NONE  gui=NONE
hi Typedef         ctermfg=26   ctermbg=NONE cterm=NONE  guifg=#0077cc  guibg=NONE  gui=NONE

hi Special         ctermfg=220  ctermbg=NONE cterm=NONE  guifg=#ffcc00  guibg=NONE  gui=NONE
hi SpecialChar     ctermfg=220  ctermbg=NONE cterm=NONE  guifg=#ffcc00  guibg=NONE  gui=NONE
hi Tag             ctermfg=39   ctermbg=NONE cterm=NONE  guifg=#00aaff  guibg=NONE  gui=NONE
hi Delimiter       ctermfg=241  ctermbg=NONE cterm=NONE  guifg=#666666  guibg=NONE  gui=NONE
hi SpecialComment  ctermfg=241  ctermbg=NONE cterm=bold  guifg=#666666  guibg=NONE  gui=bold
hi Debug           ctermfg=197  ctermbg=NONE cterm=bold  guifg=#ff2244  guibg=NONE  gui=bold

hi Underlined      ctermfg=39   ctermbg=NONE cterm=underline  guifg=#00aaff  guibg=NONE  gui=underline
hi Ignore          ctermfg=237  ctermbg=NONE cterm=NONE       guifg=#3d3d3d  guibg=NONE  gui=NONE
hi Error           ctermfg=197  ctermbg=NONE cterm=bold       guifg=#ff2244  guibg=NONE  gui=bold
