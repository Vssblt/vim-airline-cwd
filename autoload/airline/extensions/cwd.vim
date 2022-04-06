let s:spc = g:airline_symbols.space

function! airline#extensions#cwd#init(ext)
  call airline#parts#define_raw('cwd', '%{airline#extensions#cwd#shrinkedcwd()}')
  call a:ext.add_statusline_func('airline#extensions#cwd#apply')
endfunction

function! airline#extensions#cwd#apply(...)
  call airline#extensions#append_to_section('x',
        \ s:spc . g:airline_right_sep . s:spc . '%{airline#extensions#cwd#shrinkedcwd()}')
endfunction

function! airline#extensions#cwd#shrinkedcwd()
  let s:cwd = getcwd()
  if (winwidth('%') > strlen(s:cwd) * 3)
    return getcwd()
  else
    return substitute(s:cwd, '\v\w\zs.{-}\ze(\\|/)', '', 'g')
  endif
endfunction

