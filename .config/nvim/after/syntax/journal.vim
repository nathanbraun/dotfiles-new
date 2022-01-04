" Header levels, 1-6
let s:current_syntax = vimwiki#vars#get_wikilocal('syntax')

for s:i in range(1,6)
  execute 'syntax match VimwikiHeader'.s:i
      \ . ' /'.vimwiki#vars#get_syntaxlocal('rxH'.s:i, s:current_syntax).'/'
      \ . ' contains=VimwikiTodo,VimwikiHeaderChar,VimwikiNoExistsLink,VimwikiCode,VimwikiLink,@Spell'
  execute 'syntax region VimwikiH'.s:i.'Folding'
        \ . ' start=/'.vimwiki#vars#get_syntaxlocal('rxH'.s:i.'_Start', s:current_syntax).'/'
        \ . ' end=/'.vimwiki#vars#get_syntaxlocal('rxH'.s:i.'_End', s:current_syntax).'/me=s-1 transparent fold'
endfor

syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'        contains=VimwikiTodo
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'        contains=VimwikiTodo

hi def link TodoProject       Constant
hi def link TodoContext      Statement
hi VimwikiHeader1 guifg=#f94848
hi VimwikiHeader2 guifg=#ff7f00
hi VimwikiHeader3 guifg=#ffc200
hi VimwikiHeader4 guifg=#23b75f
hi VimwikiHeader5 guifg=#42b0e5
hi VimwikiHeader6 guifg=#cda8d2
