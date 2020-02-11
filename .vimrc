" NATALIE'S VIMRC <3

set nocompatible  " this tells the thing I'm using vim and not vi
filetype off " something I need to do for vundle
set encoding=utf-8 " just in case some plugin didn't get the memo

" *** VUNDLE STUFF ***

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf

call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " lets vundle update vundle!
Plugin 'Valloric/YouCompleteMe' " <3 autocomplete
Plugin 'Yggdroot/indentLine' " makes indentations more visible with lines
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
Plugin 'w0rp/ale' " syntax checking
Plugin 'fatih/vim-go' " plugin for golang
Plugin 'mxw/vim-jsx' " for react
Plugin 'junegunn/fzf.vim' " fuzzy finder
Plugin 'prettier/vim-prettier' " autoformatting for javascript
Plugin 'leafgarland/typescript-vim' "typescript
Plugin 'ianks/vim-tsx' "tsx
" Plugin 'Valloric/MatchTagAlways' " HTML tags (makes slow but useful)
call vundle#end()            " required for vundle
filetype plugin indent on    " required for vundle

" *** VARIOUS SETTINGS ***
" (mostly stolen from Brown's default .vimrc)

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
set fillchars+=vert:*  " make the middle line prettier in a vsplit

" cursorline (color chosen specifically to match my iterm theme so ymmv)
set cursorline
hi CursorLine   cterm=NONE ctermbg=238 ctermfg=NONE

" *** PLUGIN SETTINGS ***
" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-airline
let g:airline_theme='silver'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1

" fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"vim-jsx
let g:jsx_ext_required = 0

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


" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <c-n> :GFiles<cr>
nnoremap <leader>ed :GFiles?<cr>
nnoremap <c-p> :History<cr>
nnoremap <c-f> :Ag 
" searches using ag for what is under the cursor (requires ag, fzf)
nnoremap <leader>f viwy:Ag <c-r>"<cr>
