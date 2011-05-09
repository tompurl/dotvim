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
