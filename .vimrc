syntax on
colorscheme delek
set tabstop=3
set shiftwidth=3
set smarttab
set expandtab
set softtabstop=3
set autoindent
set number
set hlsearch
set ruler
set novb
set backspace=2

augroup mkd
   autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

