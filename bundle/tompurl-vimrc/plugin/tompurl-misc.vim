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

":inoremap jj <esc>
inoremap uu <esc>

:map <leader>en :cd %:p:h <Bar> new<Space>
set shortmess=a "no more hitting enter to continue
map <leader>ma <ESC>:set filetype=mail<CR>
map <leader>cl <ESC>:clo<CR>
set visualbell

"Timestamp scripts
"nmap <leader>ts "=strftime("@ %H:%M")<CR>P
"imap <leader>ts <ESC>"=strftime("@ %H:%M")<CR>Pi
iabbrev dts <ESC>"=strftime("%y/%m/%d @ %T")<CR>PA
iabbrev ts  <ESC>"=strftime("@ %T")<CR>PA
nnoremap <leader>tsh  "=strftime("%T")<CR>P
inoremap <leader>tsh  <ESC>"=strftime("%T")<CR>PA


"Open this file from any other file
"Only works on Linux/Mac
let myvimrc = "$HOME/.vim/bundle/tompurl-vimrc/plugin/tompurl-misc.vim"
:nnoremap <leader>ev :execute "split " . myvimrc <cr>
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

""""""lvsthw chapter 10
" Nothing for me to do here. I am already using caps lock instead of escape,
">and I map it at an OS level.

" Vimscript file settings ------------------------- {{{
augroup filetype_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType vim iabbrev <buffer> nf " TODO Short description ----------- {{{<cr><esc>xxifunction! TODO()<cr>echom "Hello!"<cr>endfunction<cr>" }}}
augroup END
" }}}

"""""lvsthw chapter 28
" Add a mapping that opens the previous buffer in a split of your choosing
:nnoremap <leader>bp :execute "rightbelow vsplit " . bufname("#") <cr>

"""""Start special settings for gpg diary files
" First, let's create the filetype
augroup filetypedetect_gpg
    au!
    au! BufRead,BufNewFile *.gpg setfiletype gpg
augroup END

" Now let's set some options
augroup filetype_gpg
    au!
    au FileType gpg setlocal spell
augroup END
" }}}

""" folding
set foldmethod=indent
set foldnestmax=10
"set nofoldenable
set foldlevel=2
set foldcolumn=5

""" Turn on omnicompletion
set ofu=syntaxcomplete#Complete

""" Supertab
"let g:SuperTabSetDefaultCompletionType = "":

""" Powerline
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

""" Puppet stuff
augroup filetype_puppet
  autocmd!

  autocmd BufNewFile,BufRead *.pp set filetype=puppet

augroup END

""" JSON stuff
augroup filetype_json
    autocmd!
    "autocmd FileType json nnoremap <leader>li execute !cat % | python -mjson.tool
augroup END

vnoremap <leader>bb ovi**gvOvllli** 
