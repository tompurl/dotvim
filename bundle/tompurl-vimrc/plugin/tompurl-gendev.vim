nmap <silent> <Leader>tl :Tlist<CR>
let NERDShutUp=1
       
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
