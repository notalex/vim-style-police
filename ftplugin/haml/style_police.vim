if exists('b:loaded_style_police') || &cp
  finish
else
  let b:loaded_style_police = 1
endif

let s:keepcpo             = &cpo
set cpo&vim

if !exists('b:style_police_command')
  let b:style_police_command = 'haml-lint'
endif

if !exists('b:style_police_extra_args')
  let b:style_police_extra_args = ''
endif
let b:options             = b:style_police_extra_args

command! StylePoliceCheck call style_police_stash#StyleChecker()

let &cpo= s:keepcpo
unlet s:keepcpo
