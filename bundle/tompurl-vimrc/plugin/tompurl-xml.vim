map <leader>ti <ESC>:silent 1,$!tidy -q -i -xml 2>/dev/null<CR>
au FileType xml exe ":compiler xmllint"
