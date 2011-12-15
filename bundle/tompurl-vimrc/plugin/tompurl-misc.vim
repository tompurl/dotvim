if has('win32')
    let onWindows = 1
endif

set nowrap
set expandtab
set shiftwidth=4
:map gf :e <cfile><CR>

if onWindows
    let &verbosefile = "C:/temp/vim_debug.out"
else
    let &verbosefile = "/tmp/vim_debug.out"
endif

:map <leader>en :cd %:p:h <Bar> new<Space>
set shortmess=a "no more hitting enter to continue
map <leader>ma <ESC>:set filetype=mail<CR>
map <leader>cl <ESC>:clo<CR>
set visualbell

"Timestamp scripts
nmap <leader>ts "=strftime("@ %H:%M")<CR>P
imap <leader>ts <ESC>"=strftime("@ %H:%M")<CR>Pi

"Open this file from any other file
"Only works on Linux/Mac
let myvimrc = "$HOME/.vim/bundle/tompurl-vimrc/plugin/tompurl-misc.vim"
:nnoremap <leader>ev :execute "vsplit " . myvimrc <cr>
:nnoremap <leader>sv :execute "source " . myvimrc <cr>

"Some simple abbreviations
:iabbrev @@ tom@tompurl.com 
:iabbrev ssig --<CR>Tom Purl<cr>tom@tompurl.com

""""""lvsthw chapter 9
""" Wrap words or selections in double-quotes
:nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" FIXME Does not work if the last selected char is the last char in the line.
:vnoremap <leader>" lvi"<esc>gv`<vi"<esc>
""" Wrap words or selections in single-quotes
:nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" H moves to the beginning of the line in normal mode
:nnoremap H ^
" L moves to the end of the line in normal mode
:nnoremap L $
