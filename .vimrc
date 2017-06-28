" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" syntax highlighting
syntax on
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Have Vim load indentation rules according to the detected filetype.
if has("autocmd")
  filetype indent on
endif

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set mouse=a            " Turns mouse on
set number             " Turns on numbers
set relativenumber
set cindent
set ruler
set smartindent
set splitbelow
set splitright

filetype plugin indent on

execute pathogen#infect()

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

set tabstop=2
set expandtab
set shiftwidth=2

let mapleader = ','
let maplocalleader = "\\"

inoremap <esc> <nop>

" moves a line up
nnoremap - ddp
" moves a line down
nnoremap _ dd2kp
" selects a word with a space
nnoremap <leader><space> viw
" uppercases the current word with C-u
nnoremap <leader><C-u> viwU
" makes a different escape key
inoremap jk <Esc>
" makes it easier to edit your vimrc
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" make printing better
autocmd FileType java :iabbrev <buffer> syso System.out.println()<left>
autocmd FileType go :iabbrev <buffer> syso fmt.Println()<left>


" surround in quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" this is how you do autocorrect -> iabbrev mep meep

let g:tex_flavor='latex'
