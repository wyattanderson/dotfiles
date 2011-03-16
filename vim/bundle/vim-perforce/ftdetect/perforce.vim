" Language:    p4change
" Maintainer:  Wyatt Anderson <wanderson@gmail.com>
" License:     WTFPL

autocmd BufNewFile,BufRead /tmp* :call Detect_p4change()
autocmd BufNewFile,BufRead t*.tmp :call Detect_p4change()

function! Detect_p4change ()
   if getline(1) =~ '^# A Perforce Change Specification.'
      set filetype=p4change
   endif
endfunction
