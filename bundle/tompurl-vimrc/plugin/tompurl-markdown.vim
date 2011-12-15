augroup filetypedetect
    au BufNewFile,BufRead *.mkd setf mkd
    au BufNewFile,BufRead *.markdown setf mkd
augroup END

" Create a link
:nnoremap <leader>ml i[<ESC>eli](http://TODO)
