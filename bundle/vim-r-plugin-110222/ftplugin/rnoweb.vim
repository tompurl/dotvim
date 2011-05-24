"  This program is free software; you can redistribute it and/or modify
"  it under the terms of the GNU General Public License as published by
"  the Free Software Foundation; either version 2 of the License, or
"  (at your option) any later version.
"
"  This program is distributed in the hope that it will be useful,
"  but WITHOUT ANY WARRANTY; without even the implied warranty of
"  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"  GNU General Public License for more details.
"
"  A copy of the GNU General Public License is available at
"  http://www.r-project.org/Licenses/

"==========================================================================
" ftplugin for R files
"
" Authors: Jakson Alves de Aquino <jalvesaq@gmail.com>
"          Jose Claudio Faria
"          
" Last Change: Thu Feb 17, 2011  11:02PM
"==========================================================================

" Only do this when not yet done for this buffer
if exists("b:did_rnoweb_ftplugin") || exists("disable_r_ftplugin")
    finish
endif

" Don't load another plugin for this buffer
let b:did_rnoweb_ftplugin = 1

" Source scripts common to R, Rnoweb, Rhelp and rdoc files:
runtime r-plugin/common_global.vim
if exists("g:rplugin_failed")
    finish
endif

" Some buffer variables common to R, Rnoweb, Rhelp and rdoc file need be
" defined after the global ones:
runtime r-plugin/common_buffer.vim

setlocal iskeyword=@,48-57,_,.

function! RWriteChunk()
    if getline(".") =~ "^\\s*$" && RnwIsInRCode() == 0
        call setline(line("."), "<<>>=")
        exe "normal! o@"
        exe "normal! 0kl"
    else
        exe "normal! a<"
    endif
endfunction

function! RnwIsInRCode()
    let chunkline = search("^<<", "bncW")
    let docline = search("^@", "bncW")
    if chunkline > docline
        return 1
    else
        return 0
    endif
endfunction

function! RnwPreviousChunk()
    echon
    let curline = line(".")
    if RnwIsInRCode()
        let i = search("^<<.*$", "bnW")
        if i != 0
            call cursor(i-1, 1)
        endif
    endif

    let i = search("^<<.*$", "bnW")
    if i == 0
        call cursor(curline, 1)
        call RWarningMsg("There is no previous R code chunk to go.")
    else
        call cursor(i+1, 1)
    endif
    return
endfunction

function! RnwNextChunk()
    echon
    let i = search("^<<.*$", "nW")
    if i == 0
        call RWarningMsg("There is no next R code chunk to go.")
    else
        call cursor(i+1, 1)
    endif
    return
endfunction

" Sweave and compile the current buffer content
function! RMakePDF(bibtex)
    update
    call RSetWD()
    let pdfcmd = "source('" . g:rplugin_home . "/r-plugin/vimSweave.R') ; .vim.Sweave('" . expand("%:t") . "'"

    if g:vimrplugin_latexcmd != "pdflatex"
        let pdfcmd = pdfcmd . ", latexcmd = '" . g:vimrplugin_latexcmd . "'"
    endif

    if a:bibtex == "bibtex"
        let pdfcmd = pdfcmd . ", bibtex = TRUE"
    endif

    if exists("g:vimrplugin_sweaveargs")
        let pdfcmd = pdfcmd . ", " . g:vimrplugin_sweaveargs
    endif

    let pdfcmd = pdfcmd . ")"
    let ok = SendCmdToR(pdfcmd)
    if ok == 0
        return
    endif
    echon
endfunction  

" Sweave the current buffer content
function! RSweave()
    update
    call RSetWD()
    call SendCmdToR('Sweave("' . expand("%:t") . '")')
    echon
endfunction

if g:vimrplugin_rnowebchunk == 1
    " Write code chunck in rnoweb files
    imap <buffer> < <Esc>:call RWriteChunk()<CR>a
endif

"==========================================================================
" Key bindings and menu items

call RCreateStartMaps()
call RCreateEditMaps()
call RCreateSendMaps()
call RControlMaps()
call RCreateMaps("nvi", '<Plug>RSetwd',        'rd', ':call RSetWD()')

" Only .Rnw files use these functions:
call RCreateMaps("nvi", '<Plug>RSweave',      'sw', ':call RSweave()')
call RCreateMaps("nvi", '<Plug>RMakePDF',     'sp', ':call RMakePDF("nobib")')
call RCreateMaps("nvi", '<Plug>RBibTeX',      'sb', ':call RMakePDF("bibtex")')
call RCreateMaps("nvi", '<Plug>RIndent',      'si', ':call RnwToggleIndentSty()')
nmap <buffer> gn :call RnwNextChunk()<CR>
nmap <buffer> gN :call RnwPreviousChunk()<CR>

" Menu R
call MakeRMenu()

