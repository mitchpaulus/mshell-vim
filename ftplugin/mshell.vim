setlocal iskeyword+=-

" matchit: pair if/*if/def/match and prefix-quote functions (name.) with end,
" with else/else* as the middle keywords for if blocks.
let b:match_ignorecase = 0
let b:match_words =
      \ '\<\%(if\|def\|match\)\>\|\*if\>\|\<\k\+\.\%(\s\|$\)\@=' .
      \ ':\<else\>\|\<else\*' .
      \ ':\<end\>'
