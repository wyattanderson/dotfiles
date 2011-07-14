" Language:   TWiki
" Maintainer: Wyatt Anderson <wanderson@gmail.com>
" License:    Public Domain

if exists("b:did_ftplugin")
   finish
endif

augroup coffee
au!

let b:did_ftplugin = 1

setlocal formatoptions=croqlt
setlocal tw=79
