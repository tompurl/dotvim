"Wiki sig scripts
nmap <leader>tt "=strftime(" -- TomPurl %Y-%m-%d")<CR>P
imap <leader>tt <ESC>"=strftime(" -- TomPurl %Y-%m-%d")<CR>Pi

"===vimwiki settings
let g:vimwiki_list = [{'path': '$HOME/gtd/wiki', 'path_html': '$HOME/gtd/wiki_html'}]
"let g:vimwiki_folding = 1
let g:vimwiki_folding = 0

"===Wiki markup macros
nnoremap <leader>h1 ^i= <esc>A =<esc>^
imap <leader>h1 <esc>^i= <esc>A =<esc>^
nnoremap <leader>h2 ^i== <esc>A ==<esc>^
imap <leader>h2 <esc>^i== <esc>A ==<esc>^
nnoremap <leader>h3 ^i=== <esc>A ===<esc>^
imap <leader>h3 <esc>^i=== <esc>A ===<esc>^
nnoremap <leader>h4 ^i==== <esc>A ====<esc>^
imap <leader>h4 <esc>^i==== <esc>A ====<esc>^
nnoremap <leader>h5 ^i===== <esc>A =====<esc>^
imap <leader>h5 <esc>^i===== <esc>A =====<esc>^
nnoremap <leader>h6 ^i====== <esc>A ======<esc>^
imap <leader>h6 <esc>^i====== <esc>A ======<esc>^
nnoremap <leader>wm bi[[<esc>A]]<esc>
imap <leader>h6 <esc>bi[[<esc>A]]<esc>
