"""" LVSTHW Chapter 12 Exercises
" Add an autocommand that would be useful
" The turns on spell check in all of my markdown documents.
:autocmd FileType markdown setlocal spell

"""" Create links
" Wrap a single word if the cursor is on the first character
:nnoremap <leader>ml i[<ESC>eli](http://TODO)
" Wrap a selection of text
" FIXME This does not work if the last char selected is the last char on
">the line
:vnoremap <leader>ml lvi]<esc>gv`<vi[<esc>%li(http://TODO "Short Desc")<esc>
