" Set colorscheme and fonts
if has("win32")
   set gfn=Bitstream_Vera_Sans_Mono:h10:cANSI
   au GUIEnter * simalt ~x
   map <C-F4> :tabclose<CR>
endif
colorscheme ir_black
" Disable tab bar and buttons
set guioptions-=T
set guioptions-=e
" Disable visual bell
set novb
