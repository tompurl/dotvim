" Beginnings of wiki-file specific settings
augroup filetypedetect_wiki
    au!
    au FileType vimwiki iabbrev cfo %% TODO {{{1<esc>hhhhhhhhveh
    au FileType vimwiki iabbrev cfc %% TODO }}}1<esc>hhhhhhhhveh
    au FileType vimwiki :set foldmethod=marker
    au FileType vimwiki :set spell
    " Remove all spaces from the selected string
    au FileType vimwiki :vnoremap <leader>[ <esc>:s/\%V //g<CR>
    " FIXME Only works if there is a space after the last selected character
    au FileType vimwiki vnoremap <leader>] ygvvli][<esc>pli]]<esc>gv:s/\%V //g<CR><esc>/]<cr>bi[[<esc>
    " Insert a comment block
    au FileType vimwiki iabbrev ccc {{{ ><cr>    $ <cr>}}}<esc>kllllli
    " Wiki markup macros
    au FileType vimwiki nnoremap <leader>h1 ^i= <esc>A =<esc>^
    au FileType vimwiki inoremap <leader>h1 <esc>^i= <esc>A =<esc>^
    au FileType vimwiki nnoremap <leader>h2 ^i== <esc>A ==<esc>^
    au FileType vimwiki inoremap <leader>h2 <esc>^i== <esc>A ==<esc>^
    au FileType vimwiki nnoremap <leader>h3 ^i=== <esc>A ===<esc>^
    au FileType vimwiki inoremap <leader>h3 <esc>^i=== <esc>A ===<esc>^
    au FileType vimwiki nnoremap <leader>h4 ^i==== <esc>A ====<esc>^
    au FileType vimwiki inoremap <leader>h4 <esc>^i==== <esc>A ====<esc>^
    au FileType vimwiki nnoremap <leader>h5 ^i===== <esc>A =====<esc>^
    au FileType vimwiki inoremap <leader>h5 <esc>^i===== <esc>A =====<esc>^
    au FileType vimwiki nnoremap <leader>h6 ^i====== <esc>A ======<esc>^
    au FileType vimwiki inoremap <leader>h6 <esc>^i====== <esc>A ======<esc>^
    "au FileType vimwiwki nnoremap <leader>wm bi[[<esc>A]]<esc>
    "au FileType vimwiwki inoremap <leader>h6 <esc>bi[[<esc>A]]<esc>
    " TODO Fix extra space
    au FileType vimwiki iabbrev pf ``<esc>i
augroup END

"Wiki sig scripts
nmap <leader>tt "=strftime(" -- TomPurl %Y-%m-%d")<CR>P
inoremap <leader>tt <ESC>"=strftime(" -- TomPurl %Y-%m-%d")<CR>Pi

"===vimwiki settings
let wiki_1 = {}
let wiki_1.path = "$HOME/gtd/wiki"
let wiki_1.path_html = "$HOME/gtd/wiki_html"
let wiki_1.template_default = "article"
let wiki_1.template_ext = ".html"

let wiki_2 = {}
let wiki_2.path = "$HOME/gtd/vello"
let wiki_2.path_html = "$HOME/gtd/vello_html"

let g:vimwiki_list = [wiki_1, wiki_2]

"let g:vimwiki_folding = 1
let g:vimwiki_folding = 0

" Forces vimwiki to use Chrome ----------- {{{
"function! VimwikiWeblinkHandler(weblink)
    "let browser = '/usr/bin/google-chrome'
    "execute '!start "'.browser.'" ' . a:weblink
"endfunction
" }}} 
