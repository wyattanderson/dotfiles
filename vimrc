set nocompatible
syntax on
colorscheme evening
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

" Load pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

augroup mkd
   autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

nmap <C-F4> :tabclose<CR>
nmap <C-F8> :NERDTreeToggle<CR>
