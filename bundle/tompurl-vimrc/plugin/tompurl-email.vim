function SetEmailSettings()
    colo default
    set filetype=mail
    colo default
endfunction

nmap <silent> <Leader>mx <ESC>:call SetEmailSettings()<CR>
