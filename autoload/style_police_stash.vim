if exists('g:loaded_style_police_stash') || &cp
  finish
else
  let g:loaded_style_police_stash = 1
endif

function! style_police_stash#StyleChecker(all_files)
  let command            = b:style_police_command
  let options            = b:options
  let filename           = a:all_files ? '' : @%
  let output             = system(command . ' ' . options . ' ' . filename . ' 2> /dev/null')
  " Add column number 0 if none found.
  let parseable_output   = substitute(output, '\v(\w:\d+)\ ', '\1:0 ', 'g')

  cexpr parseable_output
  copen
endfunction
