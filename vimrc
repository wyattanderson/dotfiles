" Load pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
set nocompatible
syntax on

if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

colorscheme evening

let mapleader = ","

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
set laststatus=2

" Move swap files and stuff
set directory=~/.vim/tmp,/tmp

augroup mkd
   autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

nmap <C-F4> :tabclose<CR>
nmap <C-F8> :NERDTreeToggle<CR>
map <leader><space> :let @/=''<CR>
inoremap kj <ESC>

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>

let g:tskelUserName  = 'Wyatt Anderson'
let g:tskelUserEmail = 'wanderson@gmail.com'
let g:tskelUserWWW   = 'http://www.wyattanderson.com'
let g:tskelLicense   = '(c) Wyatt Anderson - All Rights Reserved'
