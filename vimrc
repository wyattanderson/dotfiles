" Load pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
set nocompatible
syntax on

set t_Co=256
colorscheme ir_black

set tabstop=3
set shiftwidth=3
set smarttab
set expandtab
set softtabstop=3
set autoindent
set copyindent
set number
set hlsearch
set ruler
set novb
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu

augroup mkd
   autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

nmap <C-F4> :tabclose<CR>
nmap <C-F8> :NERDTreeToggle<CR>
map <leader><space> :let @/=''<CR>

let g:tskelUserName  = 'Wyatt Anderson'
let g:tskelUserEmail = 'wanderson@factset.com'
let g:tskelUserWWW   = 'http://www.factset.com/'
let g:tskelLicense   = '(c) FactSet Research Systems - All Rights Reserved'
