set nocompatible
filetype off

" ---------------------------------------------------------------------------
" Vundle setup
" ---------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'solarnz/arcanist.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'kevints/vim-aurora-syntax'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'tpope/vim-surround'
Plugin 'stephpy/vim-yaml'
Plugin 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}
Plugin 'solarnz/thrift.vim'
Plugin 'wting/rust.vim'
Plugin 'wyattanderson/salt-vim'
Plugin 'a.vim'

call vundle#end()
filetype plugin indent on

" ---------------------------------------------------------------------------
" Everything else
" ---------------------------------------------------------------------------

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
set novisualbell
set backspace=indent,eol,start
set ignorecase
set smartcase
set wildmenu
set laststatus=2
set showbreak=>
set textwidth=78
set formatoptions=croqnl1
set cursorline

if exists('+colorcolumn')
    set colorcolumn=+1,120
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
map <silent> <leader><space> :let @/=''<CR>
inoremap kj <ESC>
inoremap zkj <ESC>:w<CR>
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

" Filetype associations
autocmd BufRead,BufNewFile /etc/nginx/conf.d/* set ft=nginx
autocmd BufRead,BufNewFile *.json set ft=javascript

" Highlight VCS merge errors
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

syn keyword globalTodo TODO FIXME XXX contained
hi def link globalTodo Todo

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
    \ 'dir': 'dist$\|node_modules$\|\.git',
    \ 'file': '\v\.(pyc)',
    \ }
let g:airline_powerline_fonts = 1

let g:pymode_doc = 0
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_run = 0
let g:pymode_utils_whitespaces = 0

let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#use_splits_not_buffers = 'left'
let g:jedi#use_tabs_not_buffers = 0

let g:alternateExtensions_jsx = "scss"
let g:alternateExtensions_scss = "jsx"

colorscheme solarized
set background=dark
