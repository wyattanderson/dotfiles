" Language:    p4change
" Maintainer:  Wyatt Anderson <wanderson@gmail.com>
" License:     WTFPL

if exists("b:current_syntax")
   finish
endif

if version < 600
   syntax clear
endif

let b:current_syntax = "p4change"

syntax sync minlines=100

" Match form fields.
syntax match p4FormField /^\<\%(Change\|Client\|Date\|User\|Status\|Description\|Jobs\|Type\|Files\):/
highlight default link p4FormField Keyword

" Match comments.
syntax match p4Comment /^#.*/
syntax match p4Comment /#.*/
highlight default link p4Comment Comment
