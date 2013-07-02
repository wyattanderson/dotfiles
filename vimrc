" Load pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on
set nocompatible
syntax on

" Fixes for xterm-256colors
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
set textwidth=78
set formatoptions=croqnl1
set cursorline

if has("xterm_clipboard")
    set clipboard=unnamedplus
endif

" Enable xterm mouse support
set mouse=a

" Move swap files and stuff
if has("win32")
   set directory=$TEMP
else
   set directory=~/.vim/tmp,/tmp
endif

" Key mappings
nmap <C-F4> :tabclose<CR>
vmap <leader>c <esc>:'<,'>:CoffeeCompile<CR>
map <leader><space> :let @/=''<CR>
inoremap kj <ESC>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

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

set listchars=tab:>-,trail:?,eol:$
nmap <silent> <leader>w :set nolist!<CR>

let g:tskelUserName  = 'Wyatt Anderson'
let g:tskelUserEmail = 'wanderson@gmail.com'
let g:tskelUserWWW   = 'http://www.wyattanderson.com'
let g:tskelLicense   = '(c) Wyatt Anderson - All Rights Reserved'

" Filetype associations
autocmd BufRead,BufNewFile /etc/nginx/conf.d/* set ft=nginx
autocmd BufRead,BufNewFile *.json set ft=javascript

" Highlight VCS merge errors
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

syn keyword globalTodo TODO FIXME XXX contained
hi def link globalTodo Todo

let g:Powerline_symbols = 'fancy'

if has('autocmd')
    augroup vimrc_autocmds
        au!
        " Enable text wrapping for text files
        autocmd BufRead,BufNewFile *.{txt,markdown,mkd,twiki} set formatoptions+=t

        " Formatting options for markdown files
        autocmd BufRead *.{mkd,markdown} set ai formatoptions=tcroqn2 comments=n:&gt;
    augroup END
endif

let NERDTreeDirArrows=0

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](shared|static\/assets|research|node_modules|static\/js)$',
    \ 'file': '\v\.(pyc)',
    \ }
