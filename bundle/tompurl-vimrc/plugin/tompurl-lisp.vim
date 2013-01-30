augroup filetype_lisp
    autocmd!

    "Turn off folding
    au FileType lisp set nofoldenable
    
    " slimv stuff
    let g:slimv_lisp = '/usr/bin/clisp'
    let g:slimv_impl = 'clisp'
augroup END

