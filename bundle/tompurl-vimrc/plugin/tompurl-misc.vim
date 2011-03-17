set nowrap
set expandtab
set shiftwidth=4
:map gf :e <cfile><CR>
let &verbosefile = "/tmp/vim_debug.out"
:map <leader>en :cd %:p:h <Bar> new<Space>
set shortmess=a "no more hitting enter to continue
map <leader>ma <ESC>:set filetype=mail<CR>
map <leader>cl <ESC>:clo<CR>
set visualbell

"Timestamp scripts
nmap <leader>ts "=strftime("@ %H:%M")<CR>P
imap <leader>ts <ESC>"=strftime("@ %H:%M")<CR>Pi
