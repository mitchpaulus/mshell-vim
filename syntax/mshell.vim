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

syntax keyword MshellCommand dup
syntax keyword MshellKeyword if loop break not and or
syntax keyword MshellBoolean true false

" Patterns are always interpreted as 'magic' is set.
syntax region MshellString start=/"/ end=/"\|$/ skip=/\\"/
syntax region MshellComment start=/#/ end=/$/

highlight default link MshellComment Comment
highlight default link MshellString String
highlight default link MshellKeyword Keyword
highlight default link MshellBoolean Boolean
highlight default link MshellCommand Function

let b:current_syntax = "mshell"
