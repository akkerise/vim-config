" {{{
  let g:coc_global_extensions = [
    \ 'coc-html-css-support',
    \ 'coc-blade-formatter',
    \ 'coc-stylelintplus',
    \ 'coc-rust-analyzer',
    \ 'coc-spell-checker',
    \ 'coc-markdownlint',
    \ 'coc-tailwindcss',
    \ 'coc-fzf-preview',
    \ 'coc-translator',
    \ 'coc-cssmodules',
    \ 'coc-stylelint',
    \ 'coc-sourcekit',
    \ 'coc-highlight',
    \ 'coc-sqlfluff',
    \ 'coc-floaterm',
    \ 'coc-tsserver',
    \ 'coc-todolist',
    \ 'coc-prettier', 
    \ 'coc-denoland',
    \ 'coc-explorer',
    \ 'coc-snippets',
    \ 'coc-tabnine',
    \ 'coc-pyright',
    \ 'coc-flutter',
    \ 'coc-actions',
    \ 'coc-graphql',
    \ 'coc-eslint',
    \ 'coc-python',
    \ 'coc-svelte',
    \ 'coc-phpls',
    \ 'coc-r-lsp',
    \ 'coc-pairs',
    \ 'coc-ember',
    \ 'coc-emmet',
    \ 'coc-vetur',
    \ 'coc-json', 
    \ 'coc-html',
    \ 'coc-rome',
    \ 'coc-calc',
    \ 'coc-html',
    \ 'coc-rome',
    \ 'coc-flow',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'coc-rome',
    \ 'coc-deno',
    \ 'coc-rls',
    \ 'coc-git',
    \ 'coc-css',
    \ 'coc-sql',
    \ 'coc-xml',
    \ 'coc-git',
    \ 'coc-go',
    \ 'coc-sh',
    \ ]

" from readme
  " Better display for messages
  " set cmdheight=2
  " Smaller update time for CursorHold and CursorHoldI
  set updatetime=300
  " Always show sign columns
  set signcolumn=yes
  " prettier command for coc
  command! -nargs=0 Prettier :CocCommand prettier.formatFile
  
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  if has('nvim')
    autocmd CursorHold * silent call CocActionAsync('highlight')
  endif

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  
  " Use `:Format` for format current buffer
  command! -nargs=0 Format :call CocAction('format')
  
  " Use `:Fold` for fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  " Using CocList
" }}}

autocmd! FocusGained, BufEnter, CursorHold, CursorHoldI * if mode() != 'c' | checktime | endif

" {{{ COC
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)<Paste>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap ge :CocCommand explorer<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>cd  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Show all diagnostics
nnoremap <silent> <space>ba  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>be  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>bc  :<C-u>CocList commands<cr>
" Find symbol of current bdocument
nnoremap <silent> <space>bo  :<C-u>CocList --number-select outline<cr>
" nnoremap <silent> <leader>p :call LanguageClient_contextMenu()<CR>
" Search workspace symbolbs
nnoremap <silent> <space>bs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>bj  :<C-u>CocNext<CR>
" Do default action for pbrevious item.
nnoremap <silent> <space>bk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>bp  :<C-u>CocListResume<CR>
" }}}