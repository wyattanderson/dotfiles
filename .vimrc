set nocompatible
filetype off
filetype plugin indent on

call plug#begin('~/.vim/plugged')

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

" http://blog.ryankelly.us/2016/07/30/vim-backupcopy-webpack-dev-server.html
set backupcopy=yes

inoremap kj <ESC>
inoremap zkj <ESC>:w<CR>

let mapleader = ","

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>

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

colorscheme solarized
set background=dark
