" Set colorscheme and fonts
if has("win32")
   set gfn=Bitstream_Vera_Sans_Mono:h10:cANSI
   au GUIEnter * simalt ~x
elseif has("mac")
   set gfn=Bitstream\ Vera\ Sans\ Mono:h12
elseif has("unix")
   set gfn=Bitstream\ Vera\ Sans\ Mono\ 12
endif

colorscheme ir_black
" Disable tab bar and buttons
set guioptions-=T
set guioptions-=e
" Disable visual bell
set novb

set cursorline

" Tab mappings
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
map <C-t> :tabnew<CR>

" Map <C-C> to X11 copy
noremap <silent> <C-C> "+y<CR>
