let g:mapleader = "\<Space>"
" Autoinstall vim-plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
call plug#begin('~/.config/nvim/plugged') " Plugins initialization start {{{
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug Programing Support
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rust-lang/rust.vim'
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
" {{{

  function! LightlineFilename()
      return expand('%:.') !=# '' ? expand('%:.') : '[No Name]'
  endfunction
" }}}
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
      "autocmd CursorHold * silent call CocActionAsync('highlight')
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
Plug 'mattn/emmet-vim'
" {{{
  let g:user_emmet_leader_key = '<C-Z>'
  " let g:user_emmet_install_global = 0
  " autocmd FileType html,css EmmetInstall
" }}}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

  command -nargs=1 -complete=file E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
" }}}
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" {{{
  let g:NERDSpaceDelims = 1
" }}}
Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

Plug 'tpope/vim-fugitive'
" {{{
 " Fix broken syntax highlight in gitcommit files
 " (https://github.com/tpope/vim-git/issues/12)
 let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'

 function! ReviewLastCommit()
   if exists('b:git_dir')
     Gtabedit HEAD^{}
     nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
   else
     echo 'No git a git repository:' expand('%:p')
   endif
 endfunction
 nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

 augroup fugitiveSettings
   autocmd!
   autocmd FileType gitcommit setlocal nolist
   autocmd BufReadPost fugitive://* setlocal bufhidden=delete
 augroup END
" }}}
call plug#end() " Plugins initialization finished {{{
filetype indent on
filetype plugin on
filetype plugin indent on
if has('nvim')
  set termguicolors
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
set noexpandtab
set softtabstop=0
set shiftwidth=2
set tabstop=2
set smarttab
set nowrap
set noswapfile
set formatoptions-=t
set nu " Line number on
syntax enable
syntax on " enable highlighting
set number " enable line numbers
set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
set pastetoggle=<F2> " enable paste mode (more on this below)
set encoding=UTF-8
set cursorline
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
colorscheme onedark


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
" CREATE FLOATING WINDOW {{{
function! CreateCenteredFloatingWindow()
  let width  = float2nr(&columns * 0.9)
  let height = float2nr(&lines * 0.8)
  let top    = ((&lines - height) / 2) - 1
  let left   = (&columns - width) / 2
  let opts   = { 'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal' }
  let top    = "╭" . repeat("─", width - 2) . "╮"
  let mid    = "│" . repeat(" ", width - 2) . "│"
  let bot    = "╰" . repeat("─", width - 2) . "╯"
  let lines  = [top] + repeat([mid], height - 2) + [bot]
  let s:buf  = nvim_create_buf(v:false, v:true)

  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  call InvertBackground()

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, CreatePadding(opts))
  autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf
  autocmd BufWipeout <buffer> call ResetBackground()
endfunction

function! CreatePadding(opts)
  let a:opts.row    += 1
  let a:opts.height -= 2
  let a:opts.col    += 2
  let a:opts.width  -= 4
  return a:opts
endfunction
" }}}
" INVERT && RESET BACKGROUND {{{
function! InvertBackground()
  hi InactiveWindow guibg=NONE
  hi ActiveWindow   guibg=#2c323c
  set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

function! ResetBackground()
  hi ActiveWindow   guibg=NONE
  hi InactiveWindow guibg=#2c323c
  set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction
" }}}

" {{{ FZF
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>B :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
" History Edit Files
nnoremap <silent> <leader>h :History<CR>
" History Command 
nnoremap <silent> <leader>hh :History:<CR>
nnoremap <silent> <leader>T :Tags<CR>
nnoremap <silent> <leader>t :BTags<CR>
nnoremap <leader>F :F<SPACE>
nnoremap <leader>/ :Rg<space>
nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>gc :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>
nnoremap <leader>fs :mark '<CR>:FindSymbols<CR>
nnoremap <leader>ff :mark '<CR>:FindFunctions<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
" }}}
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

" {{{ Tagbar
" }}}

autocmd! FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

" Open terminal
nnoremap <Leader>at :call FloatTerm()<CR>
" Open tig, yes TIG, A FLOATING TIGGGG!!!!!!
nnoremap <Leader>ag :call FloatTerm('"tig"')<CR>
" Floating Term
let s:float_term_border_win = 0
let s:float_term_win = 0
function! FloatTerm(...)
  " Configuration
  let height = float2nr((&lines - 2) * 0.6)
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.6)
  let col = float2nr((&columns - width) / 2)
  " Border Window
  let border_opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': col - 2,
        \ 'width': width + 4,
        \ 'height': height + 2,
        \ 'style': 'minimal'
        \ }
  " Terminal Window
  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }
  let top = "╭" . repeat("─", width + 2). "╮"
  let mid = "│" . repeat(" ", width + 2) . "│"
  let bot = "╰" . repeat("─", width + 2) . "╯"
  let lines = [top] + repeat([mid], height) + [bot]
  let bbuf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(bbuf, 0, -1, v:true, lines)
  let s:float_term_border_win = nvim_open_win(bbuf, v:true, border_opts)
  let buf = nvim_create_buf(v:false, v:true)
  let s:float_term_win = nvim_open_win(buf, v:true, opts)
  " Styling
  hi FloatWinBorder guifg=#87bb7c
  call setwinvar(s:float_term_border_win, '&winhl', 'Normal:FloatWinBorder')
  call setwinvar(s:float_term_win, '&winhl', 'Normal:Normal')
  if a:0 == 0
    terminal
  else
    call termopen(a:1)
  endif
  startinsert
  " Close border window when terminal window close
  autocmd TermClose * ++once :bd! | call nvim_win_close(s:float_term_border_win, v:true)
endfunction 

function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '/' . s : s
    elseif i == 1
      let name = s
    else
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '/' . part : part
    endif
    let i += 1
  endfor
  return name
endfunction

let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [], [ 'filename' ], [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [], ['cocstatus', 'lineinfo', 'icongitbranch'] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['fileicon'], [ 'filename' ] ],
      \   'right': []
      \ },
      \ 'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \ 'component_function': {
      \   'fileicon': 'MyFiletype',
      \   'icongitbranch': 'DrawGitBranchInfo',
      \   'iconline': 'DrawLineInfo',
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status',
      \   'filename': 'LightLineFilename',
      \ },
      \ }

" KEY BINDINGS
nnoremap <silent><Leader>vs :vsplit<CR>
nnoremap <silent><Leader>sp :split<CR>
nnoremap <silent><Leader>ns :nohlsearch<CR>
nnoremap <silent><Leader>bn :bn<CR>
nnoremap <silent><Leader>bp :bp<CR>
