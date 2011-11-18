syntax on
set nocompatible
set showmode
set showcmd
set et
set ts=2
set sw=2
set sts=2
set ttyfast
set backspace=indent,eol,start
set cursorline
set autoindent
set hlsearch
set nonumber
set ruler
set modelines=5
set noeol
set smartcase
set incsearch
set showmatch
set ignorecase
set title

set formatoptions=qrn1

set scrolloff=3

set winminheight=0

map <C-j> <C-w>j:resize<cr>
map <C-k> <C-w>k:resize<cr>
map ,r :resize<cr>
map <F5> :make && make install<cr>
map <F1> <ESC>
imap <F1> <ESC>

au BufNewFile,BufRead *.py set sw=4
au BufNewFile,BufRead *.py set ts=4
au BufNewFile,BufRead *.py set sts=4
au BufNewFile,BufRead *.py map <F5> <esc>:!python %<cr>

au BufNewFile,BufRead *.c set sw=4
au BufNewFile,BufRead *.c set ts=4
au BufNewFile,BufRead *.c set sts=4
au BufNewFile,BufRead *.m set sw=4
au BufNewFile,BufRead *.m set ts=4
au BufNewFile,BufRead *.m set sts=4

au BufNewFile,BufRead *.go set sw=4
au BufNewFile,BufRead *.go set ts=4
au BufNewFile,BufRead *.go set sts=4
au BufNewFile,BufRead *.go setf go
au BufNewFile,BufRead *.go set noet
au BufNewFile,BufRead *.go set nonumber
au BufNewFile,BufRead *.go set tw=79

au BufNewFile,BufRead *.clj map <F5> <esc>:!./runclj %<cr>

au BufNewFile,BufRead *.hs set ts=8
au BufNewFile,BufRead *.hs set sts=8
au BufNewFile,BufRead *.hs set sw=8

au BufNewFile,BufRead Makefile set noet

au BufNewFile,BufRead *.as set syntax=javascript
au BufNewFile,BufRead *.clj set syntax=lisp

set background=dark

" https://bitbucket.org/sjl/dotfiles/src/tip/vim/.vimrc

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#444444 ctermbg=239
    redraw
    sleep 20m

    hi CursorLine guibg=#3a3a3a ctermbg=237
    redraw
    sleep 20m

    hi CursorLine guibg=#333333 ctermbg=235
    redraw
    sleep 20m

    hi CursorLine guibg=#2a2a2a ctermbg=233
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

nnoremap n nzzzv:call PulseCursorLine()<cr>
nnoremap N Nzzzv:call PulseCursorLine()<cr>

augroup ft_statuslinecolor
    au!

    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#redbar#                " Highlight the following as a warning.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

nnoremap K <nop>

let mapleader=","
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

cnoremap <c-a> <home>
cnoremap <c-e> <end>
