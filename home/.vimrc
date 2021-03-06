set nocompatible
set noeb vb t_vb=   " disable beeping
let maplocalleader=","
let mapleader="."

if has("gui_running")
  set vb t_vb=  " disable beeping (gvim)
"  set go-=T
  set visualbell
  set guioptions-=T
endif

" pathogen
call pathogen#infect()
filetype off

" color scheme
syntax enable
if has("gui_running")
  set background=dark
  color solarized
endif

set hlsearch
set incsearch
set ignorecase
set smartcase  " if search contains uppercase, then don't ignorecase

set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set laststatus=2

" formatting
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set nowrap
set bs=2
set showmatch  " show matching parens

" vimclojure
syntax on
filetype plugin indent on
let vimclojure#HighlightBultins = 1
let vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "/Users/wei/.vim/vimclojure-nailgun-client/ng"

" don't ask to autoload files
set autoread

" suffixes to put to the end of the list when completing file names
set suffixes=.bak,~,.o,.h,.info,.swp,.class,.swf

" window size
map <F2> :set columns=160<Enter><C-W>=
map <F3> :set columns=240<Enter><C-W>=

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

nnoremap <silent> <C-S-Right> <c-w>L
nnoremap <silent> <C-S-Left> <c-w>H
nnoremap <silent> <C-S-Up> <c-w>K
nnoremap <silent> <C-S-Down> <c-w>J

nmap <C-S-t> :vs<bar>:b#<CR>

" clojure shortcuts
autocmd! BufRead,BufNewFile *.clj call SetClojureShortcuts()
function SetClojureShortcuts()
  nmap <LocalLeader>sf <Plug>ClojureEvalFile.
  nmap <LocalLeader>st <Plug>ClojureEvalToplevel.
endfunction

