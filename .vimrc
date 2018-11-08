" NATALIE'S VIMRC <3

set nocompatible  " this tells the thing I'm using vim and not vi
filetype off " something I need to do for vundle
set encoding=utf-8 " just in case some plugin didn't get the memo

" VUNDLE STUFF

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " lets vundle update vundle!
Plugin 'Valloric/YouCompleteMe' " <3 autocomplete
Plugin 'Yggdroot/indentLine' " makes indentations more visible with lines
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy search and stuff
Plugin 'godlygeek/tabular' " needed for vim-markdown
Plugin 'plasticboy/vim-markdown' " makes editing markdown nicer?
Plugin 'pangloss/vim-javascript' " for javascript
Plugin 'tpope/vim-fugitive' " git support for vim
Plugin 'tpope/vim-surround' " allows you to easily edit surroundings
Plugin 'tpope/vim-repeat' " lets you repeat with . stuff that a plugin does
Plugin 'vim-airline/vim-airline' " status line
Plugin 'vim-airline/vim-airline-themes' " themes to make status line pretty
Plugin 'scrooloose/nerdtree' " displays a tree of the folders
Plugin 'airblade/vim-gitgutter' " shows +/-/~ according to git
Plugin 'edkolev/tmuxline.vim' " uses vim-airline theme to make tmux match
Plugin 'rhysd/vim-clang-format' " clang formatter
" inactive plugins as of sharding rotation:
" Plugin 'w0rp/ale' " syntax checking
" Plugin 'fatih/vim-go' " plugin for golang
" Plugin 'Valloric/MatchTagAlways' " HTML tags
" Plugin 'mxw/vim-jsx' " more javascript
call vundle#end()            " required for vundle
filetype plugin indent on    " required for vundle

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

set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set mouse=a            " Turns mouse on
set number             " Turns on numbers
set cindent            " Indenting stuff~
set tabstop=2
set expandtab
set shiftwidth=2
set shortmess+=c
set smartindent
set splitbelow
set splitright
set ignorecase         " ignores case while searching
set laststatus=2       " makes status line always visible -- good for vim-airline
set noshowmode         " hides default information under statusline
set clipboard=unnamed  " allows vim to access the system clipboard

" PLUGIN SETTINGS
let g:vim_markdown_folding_disabled = 1

" let g:tex_flavor='latex'

let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:airline#extensions#tabline#enabled = 1

let g:clang_format#command = '/home/natalie/mongo/build/clang-format-3.8.0'
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1

let g:ycm_collect_identifiers_from_tags_files = 1
" inactive as of sharding rotation
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_flow = 1
" let g:jsx_ext_required = 0
" let g:mta_filetypes = {
"       \ 'javascript.jsx': 1,
"       \ 'html' : 1,
"       \ 'xhtml' : 1,
"       \ 'xml' : 1,
"       \ 'jinja' : 1 }
" let g:ale_fix_on_save = 1

" PERSONAL MAPPING STUFF

let mapleader = ','
let maplocalleader = "\\"

" maps - to move a line up
nnoremap - ddp
" maps _ to move a line down
nnoremap _ dd2kp
" selects a word in visual mode with a space in normal mode
nnoremap <leader><space> viw
" uppercases the current word with C-u in normal mode
nnoremap <leader><C-u> viwU
" sets jk as escape for easier toggling between insert and normal mode
inoremap jk <Esc>
" makes it easier to edit your vimrc (simply do ,ev to edit your vimrc in any
" vim window, and then do ,sv to source it!)
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" can add a new line below without going into insert mode
nnoremap <leader>nl o<Esc>
" uncomments a line starting with // (kind of a shitty hardcoded shortcut)
nnoremap <leader>uc ^d3l 
" paste from clipboard
nnoremap <leader>pp :set paste<Cr>o<esc>"*]p:set nopaste<cr>
" saves
nnoremap <leader>ss <Esc>:w<cr>
" yanks whole file
nnoremap <leader>ca ggYG
" adds a semicolon to the end of the line
nnoremap <leader>sc A;<Esc>
" switches to next buffer
nnoremap <leader>n :bn<cr>
" switches to previous buffer
nnoremap <leader>p :bp<cr>
" *** ATLAS STUFF ***
" javascript code fuzzy search
" nnoremap <leader>jc :CtrlP /mms/client/js<cr>
" javascript tests fuzzy search
" nnoremap <leader>jt :CtrlP /mms/client/test<cr>
" css fuzzy search
" nnoremap <leader>css :CtrlP /mms/client/less<cr>
" server fuzzy search
" *** SHARDING STUFF ***
nnoremap <c-p> :CtrlP ~/mongo

" allows you to go to the next thing within ()
onoremap in( :<c-u>normal! f(vi(<cr>
" allows you to go to the previous thing within ()
onoremap il( :<c-u>normal! f)vi(<cr>
" in o mode, remap fb to "function body" -- selects function body (so you can
" yank or delete or change it, etc)
onoremap fb :<c-u>normal! f{vi{<cr>
