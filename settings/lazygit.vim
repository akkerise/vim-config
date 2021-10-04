" TERMINAL BEHAVIOR {{{
augroup TerminalBehavior
  autocmd!
  autocmd TermOpen * setlocal listchars= nonumber norelativenumber nowrap winfixwidth laststatus=0 noruler signcolumn=no noshowmode
  autocmd TermOpen * startinsert
  autocmd TermClose * set laststatus=2 showmode ruler
augroup END
" }}}

" {{{ Lazygit
function! ToggleLazyGit()
  echo "Loaded Lazygit"
  call ToggleTerm('lazygit')
endfunction
nnoremap <silent><leader>lg :call ToggleLazyGit()<cr>
tnoremap <silent><leader>lg <C-\><C-n>:call ToggleLazyGit()<CR>
" }}}

" TOGGLE TERMINAL && ON TERMINAL EXIT {{{
function! ToggleTerm(cmd)
  if empty(bufname(a:cmd))
    call CreateCenteredFloatingWindow()
    call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
  else
    bwipeout!
  endif
endfunction

function! OnTermExit(job_id, code, event) dict
  if a:code == 0
    bwipeout!
  endif
endfunction
" }}}