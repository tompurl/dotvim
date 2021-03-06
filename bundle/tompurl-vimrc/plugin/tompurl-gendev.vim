nmap <silent> <Leader>tl :Tlist<CR>
       
function TurnOnDevSettings()
    set number
    set foldmethod=indent
    set foldcolumn=4
endfunction

function TurnOffDevSettings()
    set nonumber
    set foldmethod=manual
    "TODO How do I turn 'off' folding?  
endfunction

nmap <silent> <Leader>dv <ESC>:call TurnOnDevSettings()<CR>
nmap <silent> <Leader>do <ESC>:call TurnOffDevSettings()<CR>

nmap <silent> <Leader>cd <ESC>:cd %:h<CR>

" Nerdtree stuff
nnoremap <Leader>nt  :NERDTreeToggle<CR>
let NERDShutUp=1

" JSON
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

" Vagrant
au! BufRead,BufNewFile *.pp set filetype=ruby

