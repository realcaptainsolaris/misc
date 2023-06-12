set nocompatible
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off
autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType rst let b:coc_suggest_disable = 1
set textwidth=80
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-dispatch'
Plugin 'preservim/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xianzhon/vim-code-runner'
Plugin 'mattn/emmet-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'honza/vim-snippets'
Plugin 'szw/vim-maximizer'
Plugin 'habamax/vim-rst'

call vundle#end()            " required

" Turn on syntax highlighting
syntax on
" set autochdir

" For plugins to load correctly
filetype plugin indent on

" map key
let mapleader = " "
" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" no swap, no backup 
set noswapfile
set nobackup

" allow pasting in vim
" set paste

" airline
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8
let g:airline_powerline_fonts = 1
" neu im feb 22
let g:airline#extensions#tabline#enabled = 1




" aliases for write/quit and write
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" ctrl c => copy, ctrl x => save and close
nnoremap <c-x> ZZ 
nnoremap <c-c> yy

" aus/von clipboard kopieren 
noremap <leader>y "+yy
noremap <leader>p "+p

" in input mode jk to escape
inoremap <nowait> jk <esc>
inoremap <nowait> kj <esc>

" resize split window
noremap <leader>h 20<c-w><
noremap <leader>ö 20<c-w>>

" maximizie current split window
noremap <C-w>m :MaximizerToggle<CR>
noremap <leader>m :MaximizerToggle<CR>

" next paragraph up and down
nnoremap J }
" nnoremap K {

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" tabs cycle with shift h and shift l
nnoremap H gT
nnoremap L gt

" scroll in pop menus with j and k (macht probleme)
" inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
" inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" surround word with double quotes!
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" surround word with paranthesis!
:nnoremap <leader>( viw<esc>a)<esc>bi(<esc>lel

" surround word with []!
:nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel

" surround word with double ``
:nnoremap <leader>= viW<esc>a``<esc>Bi``<esc>lel

" surround word with double stars!
:nnoremap <leader>* viW<esc>a**<esc>Bi**<esc>lel

" change occurence 
:nnoremap <leader>h *cgn 


" add semikolon to end of line
:nnoremap <leader>, A;<esc> 
" Fuzzy Search
nnoremap <c-p> :GFiles<CR>
nnoremap <c-g> :Ag<CR>
nnoremap <c-f> :GFiles<CR>

" visualize line and column of cursor
set cursorline
set cursorcolumn

"Blink cursor on error instead of beeping (grr)
set visualbell

" dark theme background
set background=dark

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=2
set expandtab
set noshiftround
set colorcolumn=79

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

set ttimeout
set ttimeoutlen=100
set timeoutlen=3000


" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>

" Shift S: shortcut for search and replace in document
nnoremap S :s//gI<Left><Left><Left>
nnoremap SS :%s//gI<Left><Left><Left>

" open vimrc, source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" replace mode
nnoremap rr R

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" misc
set history=1000
set wildmenu
set wildmode=list:longest
set t_Co=256

" confirms selection if any or just break line if none
function! EnterSelect()
    " if the popup is visible and an option is not selected
    if pumvisible() && complete_info()["selected"] == -1
        return "\<C-y>\<CR>"

    " if the pum is visible and an option is selected
    elseif pumvisible()
        return coc#_select_confirm()

    " if the pum is not visible
    else
        return "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    endif
endfunction

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()

" makes <CR> confirm selection if any or just break line if none
inoremap <silent><expr> <cr> EnterSelect()

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'dense-analysis/ale' macht virtuelle warnings
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'cormacrelf/vim-colors-github'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

" }}}
autocmd vimenter * ++nested colorscheme gruvbox 
" nerdtree fenster horizontal oder vertikal öffnen
map <F3> <C-w>K<CR>
map <F4> <C-w>H<CR>
map <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" compile c program and run
map <F8> :w <CR> :!gcc % -std=c99 -o %< && ./%< <CR>
map <F9> :w <CR> :!rustc % -o %< && ./%< <CR>
map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR>

" pydocstring
nmap <silent> <leader>d <Plug>(pydocstring)
let g:pydocstring_formatter = 'google'

" code runner plugin
let g:code_runner_save_before_execute = 1
nmap <silent><leader>b <plug>CodeRunner
