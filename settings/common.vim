" emmet
" {{{
  let g:user_emmet_leader_key = '<C-Z>'
  " let g:user_emmet_install_global = 0
  " autocmd FileType html,css EmmetInstall
" }}}

" nerd
" {{{
  let g:NERDSpaceDelims = 1
" }}}

colorscheme onedark
" enable mouse support
" set mouse=a
" Opening splits with terminal in all directions
if has('gui_running')
  nnoremap <Leader>h<Enter> :leftabove  :terminal<CR>
  nnoremap <Leader>l<Enter> :rightbelow :terminal<CR>
  nnoremap <Leader>k<Enter> :leftabove  :terminal<CR>
  nnoremap <Leader>j<Enter> :rightbelow :terminal<CR>
elseif has('nvim')
  nnoremap <Leader>h<Enter> :leftabove  vnew<CR>:terminal<CR>
  nnoremap <Leader>l<Enter> :rightbelow vnew<CR>:terminal<CR>
  nnoremap <Leader>k<Enter> :leftabove  new<CR>:terminal<CR>
  nnoremap <Leader>j<Enter> :rightbelow new<CR>:terminal<CR>
endif