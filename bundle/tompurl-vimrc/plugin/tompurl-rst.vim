augroup filetypedetect_rst
    au!
    " Headings
    au FileType rst nnoremap <leader>h1 ^yypv$r=o<cr><esc>
    au FileType rst inoremap <leader>h1 <esc>^yypv$r=o<cr>

    au FileType rst nnoremap <leader>h2 ^yypv$r-o.. {{{1<cr><cr><cr><cr><cr><cr>.. }}}1<esc>kkkk
    au FileType rst inoremap <leader>h2 <esc>^yypv$r-o.. {{{1<cr><cr><cr><cr><cr><cr>.. }}}1<esc>kkkki

    au FileType rst nnoremap <leader>h3 ^yypv$r+o.. {{{2<cr><cr><cr><cr><cr><cr>.. }}}2<esc>kkkk
    au FileType rst inoremap <leader>h3 <esc>^yypv$r+o.. {{{2<cr><cr><cr><cr><cr><cr>.. }}}2<esc>kkkki

    au FileType rst nnoremap <leader>h4 ^yypv$r~o.. {{{3<cr><cr><cr><cr><cr><cr>.. }}}3<esc>kkkk
    au FileType rst inoremap <leader>h4 <esc>^yypv$r~o.. {{{3<cr><cr><cr><cr><cr><cr>.. }}}3<esc>kkkki

    au FileType rst nnoremap <leader>h5 ^yypv$r*o.. {{{4<cr><cr><cr><cr><cr><cr>.. }}}4<esc>kkkk
    au FileType rst inoremap <leader>h5 <esc>^yypv$r*o.. {{{4<cr><cr><cr><cr><cr><cr>.. }}}4<esc>kkkki
    """Make Link (ml)
    " Highlight a word or phrase and it creates a link and opens a split so
    " you can edit the url separately. Once you are done editing the link,
    " simply close that split.
    au FileType rst vnoremap <leader>ml yi`<esc>gvvlli`_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. _<esc>pA: http://TODO<esc>vb
    """Make footnote (ml)
    au FileType rst iabbrev mfn [#]_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. [#] TODO
    au FileType rst set spell
    "Create image
    au FileType rst iabbrev iii .. image:: TODO.png<cr>    :scale: 100<cr>:align: center<cr><esc>kkkeel
    "Create figure
    "au FileType rst iabbrev iif .. figure:: TODO.png<cr>    :scale: 100<cr>:align: center<cr>:alt: TODO<cr><cr><cr>Some brief description<esc>kkkeel

    "Create note
    au FileType rst iabbrev nnn .. note:: 
    "Start or end bold text inline
    au FileType rst inoremap <leader>bb **
    "Start or end italicized text inline
    au FileType rst inoremap <leader>ii *
    "Start or end preformatted text inline
    au FileType rst inoremap <leader>pf ``

    " Fold settings
    "au FileType rst set foldmethod=marker
    
    " Admonitions
    au FileType rst iabbrev adw .. warning::
    au FileType rst iabbrev adn .. note::
augroup END
