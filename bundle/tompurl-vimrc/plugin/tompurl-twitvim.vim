"let twitvim_filter_regex = '@GetGlue\|/youtu\.be/'
let twitvim_filter_regex = '@GetGlue'
let twitvim_count = 50

" Open twitvim cheat sheet
let twitvimcheatsheet = "$HOME/gtd/wiki/TwitVimCheatSheet.wiki"
:nnoremap <leader>ht :execute "split " . twitvimcheatsheet <cr>

augroup filetype_twitvim
    au!
    au FileType twitvim setlocal wrap
augroup END
