set nocompatible
filetype off
filetype plugin indent on

call plug#begin('~/.vim-plug')

Plug 'tpope/vim-fugitive'
Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plug 'solarnz/arcanist.vim'
Plug 'bling/vim-airline'
Plug 'kevints/vim-aurora-syntax'
Plug 'tpope/vim-commentary'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'stephpy/vim-yaml'
Plug 'solarnz/thrift.vim'
Plug 'wting/rust.vim'
Plug 'fatih/vim-go'
Plug 'b4b4r07/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/a.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/neosnippet.vim'
Plug 'honza/vim-snippets'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'

    Plug 'flowtype/vim-flow'
    Plug 'w0rp/ale'

    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    nnoremap <c-p> :FZF<cr>
endif

call plug#end()

syntax on

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set autoindent
set copyindent
set number
set hlsearch
set ruler
set novisualbell
set noerrorbells
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu
set laststatus=2
set showbreak=>
set textwidth=78
set formatoptions=croqnl1
set cursorline
set relativenumber
set showmatch
set mouse=a

inoremap kj <ESC>
inoremap zkj <ESC>:w<CR>

let mapleader = ","

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>
map <silent> <leader><space> :let @/=''<CR>

nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

" No arrow keys for you!
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
noremap  <Up>    <NOP>
noremap  <Down>  <NOP>
noremap  <Left>  <NOP>
noremap  <Right> <NOP>

" Set up shortcut for toggling number modes since numbertoggle doesn't do it
" for us anymore
nnoremap <silent> <C-n> :set relativenumber!<cr>

silent! colorscheme solarized
set background=dark

if exists('+colorcolumn')
    set colorcolumn=+1,120
endif


let g:airline_powerline_fonts = 1

if executable('rg')
  set grepprg=rg\ --color=never
endif

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#use_tabs_not_buffers = 0

let g:deoplete#enable_at_startup = 1

let g:neosnippet#disable_runtime_snippets = {
    \ '_' : 1,
    \ }
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim-plug/vim-snippets/snippets'

let g:alternateExtensions_jsx = "scss,css"
let g:alternateExtensions_js = "scss,css"
let g:alternateExtensions_css = "jsx,js"
let g:alternateExtensions_scss = "jsx"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:flow#showquickfix = 0

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'python': []
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

nnoremap <leader>l :call system('arc browse ' . expand('%:p') . ':' . line('.'))<CR>
vnoremap <leader>l :<C-U>call system('arc browse ' . expand('%:p') . ':' . line("'<") . '-' . line("'>"))<CR>
