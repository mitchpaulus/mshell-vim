if exists('b:did_indent') | finish | endif
let b:did_indent = 1

" Reindent when opening newlines and when typing a closer
setlocal indentexpr=MyLangIndent(v:lnum)
setlocal indentkeys+=0),0],0},o,O,=end,=else,=else\*

function! MyLangIndent(lnum) abort
  let l:prevlnum = prevnonblank(a:lnum - 1)
  if l:prevlnum <= 0
    return 0
  endif

  let l:prev = getline(l:prevlnum)
  let l:this = getline(a:lnum)
  let l:sw   = shiftwidth()

  let l:ind = indent(l:prevlnum)

  " Dedent if this line has a closer token, 'end', or 'else'
  if l:this =~# '[])}]' || l:this =~# '\<end\>' || l:this =~# '\<else\>' || l:this =~# '\v(^|[^A-Za-z0-9_])else\*($|[^A-Za-z0-9_])'
    let l:ind -= l:sw
  endif

  " Indent if previous line ends with opener or contains def/if/*if/else tokens
  if l:prev =~# '[([{]\s*$' || l:prev =~# '\<def\>' || l:prev =~# '\<if\>' || l:prev =~# '\v(^|[^A-Za-z0-9_])\*if($|[^A-Za-z0-9_])' || l:prev =~# '\<else\>' || l:prev =~# '\v(^|[^A-Za-z0-9_])else\*($|[^A-Za-z0-9_])'
    let l:ind += l:sw
  endif

  return l:ind < 0 ? 0 : l:ind
endfunction
