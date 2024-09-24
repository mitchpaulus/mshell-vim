" See 43.2 'Adding a filetype' of the nvim help

" Check for mshell in the shebang or based on file extensions
" Detect filetype based on extensions
autocmd BufRead,BufNewFile *.msh,*.mshell set ft=mshell

" Detect filetype based on shebang
autocmd BufRead,BufNewFile * call s:check_shebang_for_mshell()

function! s:check_shebang_for_mshell()
    " Read the first line of the file
    let l:first_line = getline(1)

    " Check if it contains a shebang (starts with #!) and 'mshell'
    if l:first_line =~ '^#!' && l:first_line =~ 'mshell'
        " Set the filetype to mshell if the shebang contains 'mshell'
        set ft=mshell
    endif
endfunction
