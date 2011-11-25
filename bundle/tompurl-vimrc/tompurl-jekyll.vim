" Convert <code>foo</code> to `code`
:inoremap fc <ESC>/code<CR>dwhxxi`<ESC>ndwhhxxxi`<ESC>

" Convert <strong>foo</strong> to **foo**
:inoremap fs <ESC>/strong<CR>dwhxxi**<ESC>ndwhhxxxi**<ESC>

" Fix hyperlinks
" There has to be a space before the <a ...
" The entire anchor line has to be on one line
:inoremap fl <ESC>/<a\ <CR>%lv/<<CR>hxh%i[<ESC>pli]<ESC>ldwdwdwdwi(<ESC>/<\/a<CR>dwxxhhxxi)<ESC>
