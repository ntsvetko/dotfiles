" Natalie's .vimrc :D

set nocompatible
filetype off
set encoding=utf-8

" VUNDLE STUFF

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" VARIOUS SETTINGS (mostly stolen from Brown's default .vimrc)

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" syntax highlighting
syntax enable

" If using a dark background within the editing area and syntax highlighting
set background=dark

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

"set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set mouse=a            " Turns mouse on
set number             " Turns on numbers
set cindent
"set ruler
set smartindent
set splitbelow
set splitright
set ignorecase         " ignores case while searching
set tabstop=2
set expandtab
set shiftwidth=2
set shortmess+=c
set laststatus=2
set noshowmode         " hides default information under statusline
set clipboard=unnamed

" PLUGIN SETTINGS

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:vim_markdown_folding_disabled = 1
let g:tex_flavor='latex'
let g:airline_theme='alduin'

" PERSONAL MAPPING STUFF

let mapleader = ','
let maplocalleader = "\\"

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

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! f)vi(<cr>
" in o mode, remap fb to "function body"
onoremap fb :<c-u>normal! f{vi{<cr>

