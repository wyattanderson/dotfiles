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

colorscheme tir_black

let mapleader = ","

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
set novb
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu
set laststatus=2
set showbreak=>
set textwidth=79
set formatoptions=croqnl1

" Move swap files and stuff
if has("win32")
   set directory=$TEMP
else
   set directory=~/.vim/tmp,/tmp
endif

augroup mkd
   autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

" Key mappings
nmap <C-F4> :tabclose<CR>
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader><space> :let @/=''<CR>
inoremap kj <ESC>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

" No arrow keys for you!
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

autocmd BufRead,BufNewFile /etc/nginx/conf.d/* set ft=nginx

" Highlight VCS merge errors
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight lines longer than 80 characters as dark-red, lines longer than 90
" characters as a brighter red.
augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=124 guibg=#990000
    autocmd BufEnter * highlight SortaOverLength ctermbg=52 guibg=#330000
    autocmd BufEnter * match SortaOverLength /\m\%>80v.\%<91v/
    autocmd BufEnter * 2match OverLength /\m\%>90v.\%<100v/
augroup END

syn keyword globalTodo TODO FIXME XXX contained
hi def link globalTodo Todo

let NERDTreeDirArrows=0
