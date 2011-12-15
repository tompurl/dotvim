augroup filetypedetect
    au BufNewFile,BufRead *.mkd setf mkd
    au BufNewFile,BufRead *.markdown setf mkd
augroup END

"""" Create links
" Wrap a single word if the cursor is on the first character
:nnoremap <leader>ml i[<ESC>eli](http://TODO)
" Wrap a selection of text
" FIXME This does not work if the last char selected is the last char on
">the line
:vnoremap <leader>ml lvi]<esc>gv`<vi[<esc>%li(http://TODO "Short Desc")<esc>
