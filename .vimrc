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
set nowb

" allow pasting in vim
" set paste

" airline
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8
let g:airline_powerline_fonts = 1
" neu im feb 22
let g:airline#extensions#tabline#enabled = 1


" => Visual mode related
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>



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
set magic
set mat=2

" clean search highlighting
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
let NERDTreeIgnore = ['\.pyc$', '^.mypy_cache$', '^env$', '^node_modules$']

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


" #################################################################
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
 " nmap <silent> [g <Plug>(coc-diagnostic-prev)
 " nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:startify_fortune_use_unicode = 1
" let g:startify_custom_header = system('cowsay ' + 'startify#fortune#quote()')
" let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
inoremap <silent><expr> <TAB>  
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" VIM RST auto adjust section header underlines
func! s:section_delimiter_adjust() abort
    let section_delim = '^\([=`:."' . "'" . '~^_*+#-]\)\1*$'
    let cline = getline('.')
    if cline =~ '^\s*$' | return | endif
    if cline !~ section_delim && cline !~ '^\s\+\S'
        let nline = getline(line('.') + 1)
        let pline = getline(line('.') - 1)
        if pline =~ '^\s*$' && nline =~ section_delim
            call setline(line('.') + 1, repeat(nline[0], strchars(cline)))
        elseif pline =~ section_delim && nline =~ section_delim && pline[0] == nline[0]
            call setline(line('.') + 1, repeat(nline[0], strchars(cline)))
            call setline(line('.') - 1, repeat(pline[0], strchars(cline)))
        endif
    endif
endfunc

augroup rst_section | au!
    au InsertLeave <buffer> :call s:section_delimiter_adjust()
augroup END
autocmd FileType javascript setlocal indentkeys-=;

" Remember FOLDS
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent! loadview 1
augroup END
