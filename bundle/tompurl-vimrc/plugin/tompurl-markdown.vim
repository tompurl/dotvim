""" LVSTW Chapter 14 Exercisee
" Wrap your autocmd's in augroups.
augroup filetype_markdown
    autocmd!

    """" LVSTHW Chapter 12 Exercises
    " Add an autocommand that would be useful
    " The turns on spell check in all of my markdown documents.
    autocmd FileType markdown setlocal spell

    """" LVSTHW Chapter 13 Exercises
    " Create a \"snippet\" abbreviation 
    " This creates a YAML front matter header for a blog post. After the snippet
    ">is written, the title placeholder of the header will be visually selected.
    autocmd FileType markdown iabbrev <buffer> yfm ---<cr>layout: post<cr>title: TODO<cr>published: true<cr>type: post<cr>status: publish<cr>---<esc>kkkkeellveh
    
    """" Create links
    " Wrap a single word if the cursor is on the first character
    autocmd FileType markdown nnoremap <buffer><leader>ml i[<ESC>eli](http://TODO)
    " Wrap a selection of text
    " FIXME This does not work if the last char selected is the last char on
    ">the line
    autocmd FileType markdown vnoremap <buffer><leader>ml lvi]<esc>gv`<vi[<esc>%li(http://TODO "TODO")<esc>

    """" Create Images
    autocmd FileType markdown iabbrev <buffer> ni ![TODO Alt text](/images/TODO "TODO Optional title")<esc>bbbbbbve

augroup END

