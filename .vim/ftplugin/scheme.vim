setlocal expandtab
inoremap <buffer> <C-F> <C-O>==
nnoremap <buffer> <expr> = g:SchemeIndentExpr()
vnoremap <buffer> <expr> = g:SchemeIndentExpr()
nnoremap <buffer> == ==

function! g:SchemeIndentExpr(type = '') abort
	if a:type == ''
		set opfunc=g:SchemeIndentExpr
		return 'g@'
	endif
	'[,']normal! ==
endfunction
