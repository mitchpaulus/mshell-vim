if exists('b:did_indent') | finish | endif
let b:did_indent = 1

" Reindent when opening newlines and when typing a closer
setlocal indentexpr=MyLangIndent(v:lnum)
setlocal indentkeys+=0),0],0},o,O,=end

function! MyLangIndent(lnum) abort
  let l:prevlnum = prevnonblank(a:lnum - 1)
  if l:prevlnum <= 0
    return 0
  endif

  let l:prev = getline(l:prevlnum)
  let l:this = getline(a:lnum)
  let l:sw   = shiftwidth()

  let l:ind = indent(l:prevlnum)

  " Dedent if this line starts with a closer token or 'end'
  if l:this =~# '^\s*[])}]' || l:this =~# '^\s*end\>'
    let l:ind -= l:sw
  endif

  " Indent if previous line ends with opener or starts a def line
  if l:prev =~# '[([{]\s*$' || l:prev =~# '^\s*def\>'
    let l:ind += l:sw
  endif

  return l:ind < 0 ? 0 : l:ind
endfunction
