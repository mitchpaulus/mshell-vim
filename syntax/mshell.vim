" Vim syntax file
" Language:    mshell
" Maintainer:  Mitchell T. Paulus
" Last Change: 2024-09-10
" Remark:      Experimental concatenative shell language

" See 44.12 Portable syntax file layout

if exists("b:current_syntax")
    echom "Exited early"
    echom b:current_syntax
    finish
endif

" syntax keyword MshellCommand dup .s swap drop rot over nip tuck append w wl we wle len args nth glob x cd str findReplace lines split wsplit join map 
" syntax keyword MshellCommand each del insert export stdin
syntax keyword MshellKeyword if loop break not and or
syntax keyword MshellBoolean true false
syntax keyword MshellDefKeyword def end

" Patterns are always interpreted as 'magic' is set.
syntax region MshellString start=/"/ end=/"\|$/ skip=/\\"/
syntax region MshellPath start=/`/ end=/`\|$/ skip=/\\`/

syntax region MshellSingleQuoteString start=/'/ end=/'\|$/
syntax region MshellComment start=/#/ end=/$/

syntax match MshellArgument /\v\$[0-9]+/

" Variables being set are varname!, and being retrieved are @varname
syntax match MshellVarSet /\v[_a-zA-Z0-9-]+!/
syntax match MshellVarRetrieve /\v\@[_a-zA-Z0-9-]+/

highlight default link MshellComment Comment
highlight default link MshellString String
highlight default link MshellSingleQuoteString String
highlight default link MshellPath String
highlight default link MshellKeyword Keyword
highlight default link MshellDefKeyword Keyword
highlight default link MshellBoolean Boolean
highlight default link MshellCommand Function
highlight default link MshellArgument Identifier
highlight default link MshellVarSet Define
highlight default link MshellVarRetrieve Type


let b:current_syntax = "mshell"
