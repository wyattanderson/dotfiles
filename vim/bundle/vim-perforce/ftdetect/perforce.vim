autocmd BufNewFile,BufRead /tmp* :call Detect_p4change()

function! Detect_p4change ()
   if getline(1) =~ '^# A Perforce Change Specification.'
      set filetype=p4change
   endif
endfunction
