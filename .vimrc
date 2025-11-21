" NATALIE'S VIMRC <3

set nocompatible  " this tells the thing I'm using vim and not vi
filetype off " something I need to do for vundle
set encoding=utf-8 " just in case some plugin didn't get the memo
set rtp+=/opt/homebrew/opt/fzf

" *** VIM-PLUG STUFF ***
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine' " makes indentations more visible with lines
Plug 'godlygeek/tabular' " needed for vim-markdown
Plug 'plasticboy/vim-markdown' " makes editing markdown nicer
Plug 'pangloss/vim-javascript' " for javascript
Plug 'tpope/vim-fugitive' " git support for vim
Plug 'tpope/vim-surround' " allows you to easily edit surroundings
Plug 'tpope/vim-commentary' " comments
Plug 'tpope/vim-repeat' " lets you repeat with . stuff that a plugin does
Plug 'terryma/vim-multiple-cursors' " multiple cursors
Plug 'tpope/vim-rhubarb' " better git support
Plug 'vim-airline/vim-airline' " status line
Plug 'vim-airline/vim-airline-themes' " themes to make status line pretty
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} "displays a tree of the folders
Plug 'airblade/vim-gitgutter' " shows +/-/~ according to git
Plug 'edkolev/tmuxline.vim' " uses vim-airline theme to make tmux match
Plug 'fatih/vim-go' " plugin for golang
Plug 'mxw/vim-jsx' " for react
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'prettier/vim-prettier' " autoformatting for javascript
Plug 'leafgarland/typescript-vim' "typescript
Plug 'ianks/vim-tsx' "tsx
Plug 'easymotion/vim-easymotion' "easymotion
call plug#end()

filetype plugin indent on

" *** VARIOUS SETTINGS ***
" (mostly stolen from Brown's default .vimrc)

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" syntax highlighting
syntax enable

" If using a light background within the editing area and syntax highlighting
set background=light

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
set number relativenumber             " Turns on hybrid numbers
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
set fillchars+=vert:┊ " make the middle line prettier in a vsplit

" *** HIGHLIGHT STUFF ***
" the following is all mostly hard-coded in to match my theme (Solarized Light, currently)

" italic comments
highlight Comment cterm=italic ctermfg=grey ctermbg=NONE

" cursorline
set cursorline
highlight CursorLine cterm=NONE ctermbg=60 ctermfg=NONE
hi CursorLineNr term=bold cterm=bold ctermfg=012 gui=bold
" change the color of the cursorline if you are in insert mode
autocmd InsertEnter * highlight  CursorLine cterm=NONE ctermbg=223 ctermfg=NONE
autocmd InsertLeave * highlight CursorLine cterm=NONE ctermbg=60 ctermfg=NONE

highlight Search cterm=NONE ctermbg=222 ctermfg=NONE
highlight LineNr cterm=italic ctermfg=103
highlight VertSplit cterm=NONE ctermbg=223

" making gitgutter pretty
highlight clear SignColumn
highlight GitGutterAdd ctermfg=106
highlight GitGutterChange ctermfg=178
highlight GitGutterDelete ctermfg=197
highlight GitGutterChangeDelete ctermfg=178

" *** PLUGIN SETTINGS ***
" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-airline
let g:airline_theme='silver'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" respect terminal colors (I edited this a bit from the recommended defaults)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Statement', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Comment'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'EndOfBuffer'] }

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"vim-jsx
let g:jsx_ext_required = 0

"indentLine
let g:indentLine_char = '┊'

" *** PERSONAL MAPPINGS ***

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
" nnoremap <leader>nl o<Esc>
" uncomments a line starting with // (kind of a shitty hardcoded shortcut)
nnoremap <leader>uc ^d3l 
" paste from clipboard
nnoremap <leader>v :set paste<Cr>o<esc>"*]p:set nopaste<cr>
" saves
nnoremap <leader>ss <Esc>:w<cr>
" yanks whole file
nnoremap <leader>ca ggYG
" moves to next buffer
nnoremap <leader>n :bnext<cr>
" moves to previous buffer
nnoremap <leader>p :bprev<cr>
" exits current buffer
nnoremap <c-x> :bd<cr>
" starts out a search and replace with the word under the cursor
nnoremap <leader>r viwy:%s/<c-r>"/
" starts out a search and replace with the word under the cursor in all
" buffers
nnoremap <leader>ra viwy:bufdo %s/<c-r>"/

" *** PERSONAL PLUGIN MAPPINGS: ***
" --- vim-go ---
" shows GoDoc documentation
au FileType go nmap <leader>gd <Plug>(go-doc)
" shows callers of Go function
au FileType go nmap <leader>gc <Plug>(go-callers)
" lists declarations (requires fzf or ctrlp)
au FileType go nmap <leader>go :GoDecls<cr>
" lists declarations in directory (requires fzf or ctrlp)
au FileType go nmap <leader>gf :GoDeclsDir<cr>

" --- fugitive ---
nnoremap <leader>gb :Git blame<cr>

" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <c-n> :GFiles<cr>
nnoremap <leader>ed :GFiles?<cr>
nnoremap <c-p> :History<cr>
nnoremap <c-f> :Ag 
" searches using ag for what is under the cursor (requires ag, fzf)
nnoremap <leader>f viwy:Ag <c-r>"<cr>
