" NATALIE'S VIMRC <3

set nocompatible  " this tells the thing I'm using vim and not vi
filetype off " something I need to do for vundle
set encoding=utf-8 " just in case some plugin didn't get the memo
set rtp+=/usr/local/opt/fzf

" *** VIM-PLUG STUFF ***
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " trying this out for autocomplete
Plug 'Yggdroot/indentLine' " makes indentations more visible with lines
Plug 'godlygeek/tabular' " needed for vim-markdown
Plug 'plasticboy/vim-markdown' " makes editing markdown nicer?
Plug 'pangloss/vim-javascript' " for javascript
Plug 'tpope/vim-fugitive' " git support for vim
Plug 'tpope/vim-surround' " allows you to easily edit surroundings
Plug 'tpope/vim-repeat' " lets you repeat with . stuff that a plugin does
Plug 'tpope/vim-rhubarb' " better git support
Plug 'vim-airline/vim-airline' " status line
Plug 'vim-airline/vim-airline-themes' " themes to make status line pretty
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}" displays a tree of the folders
Plug 'airblade/vim-gitgutter' " shows +/-/~ according to git
Plug 'edkolev/tmuxline.vim' " uses vim-airline theme to make tmux match
Plug 'fatih/vim-go' " plugin for golang
Plug 'mxw/vim-jsx' " for react
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'prettier/vim-prettier' " autoformatting for javascript
Plug 'leafgarland/typescript-vim' "typescript
Plug 'ianks/vim-tsx' "tsx
call plug#end()

filetype plugin indent on

" *** VARIOUS SETTINGS ***
" (mostly stolen from Brown's default .vimrc)

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" syntax highlighting
syntax enable

" If using a dark background within the editing area and syntax highlighting
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
set fillchars+=vert:*  " make the middle line prettier in a vsplit

" italic comments
highlight Comment cterm=italic ctermfg=grey

" highlight cursorline (color chosen specifically to match my iterm theme so ymmv)
set cursorline
hi CursorLine cterm=NONE ctermbg=7 ctermfg=NONE

" *** PLUGIN SETTINGS ***
" vim-markdown
let g:vim_markdown_folding_disabled = 1

" vim-airline
let g:airline_theme='silver'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" coc.nvim
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes

"" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"" close preview window
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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

" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <c-n> :GFiles<cr>
nnoremap <leader>ed :GFiles?<cr>
nnoremap <c-p> :History<cr>
nnoremap <c-f> :Ag 
" searches using ag for what is under the cursor (requires ag, fzf)
nnoremap <leader>f viwy:Ag <c-r>"<cr>
