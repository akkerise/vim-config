" {{{
  set statusline+=\ %#warningmsg#
  set statusline+=\ %{SyntasticStatuslineFlag()}
  set statusline+=\ %*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
" }}}
"{{{
  let g:syntastic_rust_rustc_exe = 'cargo check'
  let g:syntastic_rust_rustc_fname = ''
  let g:syntastic_rust_rustc_args = '--'
  let g:syntastic_rust_checkers = ['rustc']
  let g:syntastic_rust_checkers['cargo']
"}}}
" {{{
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}