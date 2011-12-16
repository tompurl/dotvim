function! DisplayName(name)
    echom "Hello! My name is:"
    echom a:name
endfunction

" TODO Short description ----------- {{{
function! Varg(...)
    echom a:0
    echom a:1
    echo a:000
endfunction
" }}} 

" TODO Short description ----------- {{{
function! Varg2(foo, ...)
    echom a:foo
    echom a:0
    echom a:1
    echo a:000
endfunction
" }}} 

" TODO Short description ----------- {{{
function! Assign(foo)
    let a:foo = "Nope"
    echom a:foo
endfunction
" }}}

" TODO Short description ----------- {{{
function! AssignGood(foo)
    let foo_tmp = a:foo
    let foo_tmp = "Yep"
    echom foo_tmp
endfunction
" }}}

" TODO Short description ----------- {{{
function! FooTrueTest()
    if "foo"
        echo "yes"
    else
        echo "no"
    endif
endfunction
" }}} 
