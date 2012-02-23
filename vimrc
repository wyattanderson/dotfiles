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
set textwidth=78
set formatoptions=croqnl1

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

autocmd BufRead,BufNewFile /etc/nginx/conf.d/* set ft=nginx

" Highlight VCS merge errors
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

syn keyword globalTodo TODO FIXME XXX contained
hi def link globalTodo Todo

" Utility Functions
if exists(':function') == 2
    function! StatusLineTabWarning()
        " return '[&et]' if &expandtab is set wrong
        " return '[mixed-indenting]' if spaces and tabs are used to indent
        " return an empty string if everything is fine
        if !exists('b:statusline_tab_warning')
            if &filetype == 'help' || &readonly == 1 || &modifiable == 0
                let b:statusline_tab_warning = ''
            else
                let tabs = search('^\t', 'nw') != 0
                let spaces = search('^ ', 'nw') != 0
                if tabs && spaces
                    let b:statusline_tab_warning = '[mixed-indenting]'
                elseif (spaces && !&expandtab) || (tabs && &expandtab)
                    let b:statusline_tab_warning = '[&et]'
                else
                    let b:statusline_tab_warning = ''
                endif
            endif
        endif
        return b:statusline_tab_warning
    endfunction
endif

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
set statusline=%<\ %n:%f\ %m%r%y%{StatusLineTabWarning()}%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

if has('autocmd')
    augroup vimrc_autocmds
        au!
        " Clear the statusline tab warning at idle and post-buffer-write
        autocmd CursorHold,BufWritePost * unlet! b:statusline_tab_warning

        " Enable text wrapping for text files
        autocmd BufRead,BufNewFile *.{txt,markdown,mkd,twiki} set formatoptions+=t

        " Formatting options for markdown files
        autocmd BufRead *.{mkd,markdown} set ai formatoptions=tcroqn2 comments=n:&gt;
    augroup END

endif

let NERDTreeDirArrows=0
