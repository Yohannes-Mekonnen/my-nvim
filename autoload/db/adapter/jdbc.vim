function! db#adapter#jdbc#canonicalize(url) abort
  return substitute(a:url, '^jdbc:', '', '')
endfunction

function! db#adapter#jdbc#input_extension(...) abort
  return 'sql'
endfunction
