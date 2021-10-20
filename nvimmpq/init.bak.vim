if has('mac')
    let g:python_host_prog='/usr/local/bin/python3'
else
    let g:python_host_prog='/usr/bin/python3'
endif
let g:mapleader = "\<Space>"
"let mapleader = ','
" Autoinstall vim-plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
call plug#begin('~/.config/nvim/plugged') " Plugins initialization start {{{
" }}}
" Appearance
" ====================================================================
"Plug 'mhartington/oceanic-next'
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'joshdick/onedark.vim'
" Plug 'norcalli/nvim-base16.lua'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons' " lua

" Completion
" ====================================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" {{{
  let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint', 
    \ 'coc-prettier', 
    \ 'coc-json', 
    \ 'coc-css',
    \ 'coc-vetur',
    "\ 'coc-snippets',
    "\ 'coc-go',
    "\ 'coc-phpls',
    \ 'coc-python'
    \ ]
  "let g:coc_snippet_next = '<tab>'
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
  command! -nargs=? Fold :call CocAction('fold', <f-args>)
  " Using CocList
" }}}
Plug 'mattn/emmet-vim'
" {{{
  let g:user_emmet_leader_key = '<C-Z>'
  " let g:user_emmet_install_global = 0
  " autocmd FileType html,css EmmetInstall
" }}}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'natebosch/dartlang-snippets'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring', { 'branch': 'main' }

" File Navigation
" ====================================================================
Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
"Plug 'junegunn/fzf'
"Plug 'junegunn/fzf.vim'
"" {{{
"  let g:fzf_colors =
"  \ { 'fg':      ['fg', 'Normal'],
"    \ 'bg':      ['bg', 'Normal'],
"    \ 'hl':      ['fg', 'Comment'],
"    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"    \ 'hl+':     ['fg', 'Statement'],
"    \ 'info':    ['fg', 'PreProc'],
"    \ 'border':  ['fg', 'Ignore'],
"    \ 'prompt':  ['fg', 'Conditional'],
"    \ 'pointer': ['fg', 'Exception'],
"    \ 'marker':  ['fg', 'Keyword'],
"    \ 'spinner': ['fg', 'Label'],
"    \ 'header':  ['fg', 'Comment'] }
"  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
"  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
"
"  let g:rg_command = '
"  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
"  \ -g "*.{js,json,php,md,styl,jade,html,phtml,css,config,py,xml,cpp,c,go,hs,rb,conf}"
"  \ -g "!{.git,node_modules,pub,var,bin,setup}/*"
"  \ -g "!{phpctags}" '
"
"  command! -bang -nargs=* FindSymbols
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always "(private|public|protected)[ \t]+(static )*(\\\$[a-zA-Z0-9_]+)" -g "*.php" -S | rg -S '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
"  command! -bang -nargs=* FindFunctions
"    \ call fzf#vim#grep(
"    \   'rg --column --line-number --no-heading --color=always "function +([a-zA-Z0-9_]+)" -g "*.php" | rg -g "*.rs" -S '.substitute(shellescape(<q-args>), " ", "|rg -g '*.rs' -S", ""), 1,
"    \   <bang>0 ? fzf#vim#with_preview('up:40%')
"    \           : fzf#vim#with_preview('right:20%:hidden', '?'),
"    \   <bang>0)
"
"  command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
"  command -nargs=1 -complete=file E execute('silent! !mkdir -p "$(dirname "<args>")"') <Bar> e <args>
"" }}}
"Plug 'scrooloose/nerdtree'
"{{{
  " let NERDTreeHijackNetrw=0
  " let g:NERDTreeWinSize=25
  " let g:NERDTreeAutoDeleteBuffer=1
  " let NERDTreeMinimalUI=1
  " let NERDTreeCascadeSingleChildDir=0
  " let g:NERDTreeDirArrowExpandable = '+'
  " let g:NERDTreeDirArrowCollapsible = '-'
  " nnoremap <silent> <leader>n :NERDTreeToggle<CR>
"}}}
"Plug 'tpope/vim-vinegar'
"" {{{
"  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
"" }}}

" Text Manipulation
" ====================================================================
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
"Plug 'scrooloose/nerdcommenter'
"" {{{
"  let g:NERDSpaceDelims = 1
"" }}}
" Plug 'windwp/nvim-autopairs'
Plug 'Raimondi/delimitMate'
" {{{
  let delimitMate_expand_cr = 2
  let delimitMate_expand_space = 1 " {|} => { | }
" }}}
"Plug 'terryma/vim-multiple-cursors'

" Text Objects
" ====================================================================
"Plug 'wellle/targets.vim'

" Languages
" ====================================================================
" Plug 'Valloric/MatchTagAlways'
"Plug 'sheerun/vim-polyglot'
Plug 'dart-lang/dart-vim-plugin'
" {{{
  let dart_html_in_string=v:true
  let g:dart_style_guide=2
  let g:dart_format_on_save=1
" }}}
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fatih/vim-go'
" {{{
  let g:go_bin_path="/Users/omerta/go/bin"
  let g:go_fmt_command='goimports'
  let g:go_def_mapping_enabled=0
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
" }}}
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'othree/html5.vim'
""" Yet Another JS Syntax
"" Plug 'othree/yajs.vim', { 'for': 'javascript' }
"" Plug 'HerringtonDarkholme/yats.vim'
""Plug 'gavocanov/vim-js-indent'
"Plug 'pangloss/vim-javascript'
"" {{{
"  let g:javascript_plugin_jsdoc = 1
"" }}}
"" Plug 'mxw/vim-jsx'
"" {{{
"  " let g:jsx_ext_required = 1
"" }}}
""Plug 'othree/javascript-libraries-syntax.vim'
""" {{{
""  let g:used_javascript_libs = 'jquery,vue'
""" }}}
"Plug 'posva/vim-vue'
""{{{
" let g:vue_pre_processors = ['scss']
""}}}
""Plug 'digitaltoad/vim-pug'
"Plug 'hail2u/vim-css3-syntax'
""Plug 'groenewege/vim-less'
"Plug 'elzr/vim-json'
Plug 'norcalli/nvim-colorizer.lua'
"" Plug 'tpope/vim-haml'
" Plug 'ap/vim-css-color'
"" Plug 'jvirtanen/vim-octave'
"" Plug 'vim-vdebug/vdebug'
""Plug '2072/PHP-Indenting-for-VIm'
""Plug 'StanAngeloff/php.vim'
""" {{{
""  let g:php_var_selector_is_identifier = 1
""  " let g:php_sql_query = 0
""  " let g:php_sql_heredoc = 0
""  " let g:php_sql_nowdoc = 0
""" }}}
""Plug 'blueyed/smarty.vim'
"" Plug 'iakio/smarty3.vim'
"" " {{{
"" au BufRead,BufNewFile *.tpl set filetype=smarty3
"" " }}}
"Plug 'moll/vim-node'
"" {{{
"  " <c-w>f to open file under cursor in a vertical split
"  autocmd User Node
"    \ if &filetype == "javascript" |
"    \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
"    \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
"    \ endif
"" }}}
"Plug 'tomlion/vim-solidity'
"Plug 'jwalton512/vim-blade'
"" {{{
"  " Define some single Blade directives. This variable is used for highlighting only.
"  let g:blade_custom_directives = ['datetime', 'javascript']
"
"  " Define pairs of Blade directives. This variable is used for highlighting and indentation.
"  let g:blade_custom_directives_pairs = {
"      \   'markdown': 'endmarkdown',
"      \   'cache': 'endcache',
"      \ }
"" }}}
"Plug 'udalov/kotlin-vim'

" Git
" ====================================================================
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
" Plug 'junegunn/gv.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}
"Plug 'airblade/vim-gitgutter'
"" {{{
" let g:gitgutter_map_keys = 0
" let g:gitgutter_max_signs = 2000
" let g:gitgutter_realtime = 1
" let g:gitgutter_eager = 1
" let g:gitgutter_sign_added = '▌'
" let g:gitgutter_sign_modified = '▌'
" let g:gitgutter_sign_removed = '▁'
" let g:gitgutter_sign_removed_first_line = '▌'
" let g:gitgutter_sign_modified_removed = '▌'
" " let g:gitgutter_sign_removed = '–'
" let g:gitgutter_diff_args = '--ignore-space-at-eol'
"" }}}

" Utility
" ====================================================================
"Plug 'ripxorip/bolt.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'neomake/neomake'
"" {{{
"  autocmd! BufWritePost * Neomake
"  let g:neomake_javascript_enabled_makers = ['eslint']
"" }}}
" Plug 'w0rp/ale'
" " {{{
  " let g:ale_sign_column_always = 1
  " let g:ale_sign_error = '⚑'
  " let g:ale_sign_warning = '⚐'
" " }}}
" if !has('nvim')
    " Plug 'roxma/vim-hug-neovim-rpc'
    " Plug 'roxma/nvim-yarp'
" endif
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-unimpaired'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}
Plug 'sbdchd/neoformat'
" Plug 'mhinz/vim-grepper'
" " {{{
  " let g:grepper = { 'next_tool': '<leader>g' }
  " let g:grepper = {
    " \ 'tools': ['rg', 'git'],
    " \ }
" " }}}
Plug 'mbbill/undotree'
" {{{
  set undofile
  " Auto create undodir if not exists
  let undodir = expand($HOME . '/.config/nvim/cache/undodir')
  if !isdirectory(undodir)
    call mkdir(undodir, 'p')
  endif
  let &undodir = undodir

  nnoremap <leader>U :UndotreeToggle<CR>
" }}}

call plug#end() " Plugins initialization finished {{{
" }}}

" Plugin settings
" {{{ vim-json
let g:vim_json_syntax_conceal = 0
" let g:indentLine_noConcealCursor=""
" }}}

" General settings
" ===========================================================
filetype indent on
filetype plugin on
filetype plugin indent on

" Source .vimrc file if it is present in working directory
"set exrc
"set secure

"set tabstop=4
if has('nvim')
  set termguicolors
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"set tw=80
" Turn off text wrapping
set wrap linebreak
"set lazyredraw                      " Don't redraw screen during macros
" Indentation {{{
" ============================================================
set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
" set noexpandtab
" }}}
1,$retab!
" Remove whitespace on save
" autocmd BufWritePre * %s/\s\+$//e
set autoindent
set smartindent
set smarttab
" Locate where folds are
set foldcolumn=1
set foldnestmax=2
set backspace=indent,eol,start
set nu " Line number on
set relativenumber
set noswapfile
set nrformats+=alpha
set incsearch " Incremental search
set nohlsearch " Turn off highlighting search matches
"set mouse=a " Mouse scroll on
set mouse=   " Disable mouse
set cinwords=if,else,while,do,for,switch,case
set wildmenu
set wildmode=longest:full,full
"set wildmode=full wildmenu  " Enable command-line tab completion
set wildignore+=*.a,*.o,*.obj,*.pyc,*.DS_Store,*.db,*.swp,*.tmp
" set completeopt=preview        " Don't show extra info on completion
set completeopt=menu        " Don't show extra info on completion
set ignorecase smartcase    " Only be case sensitive when search contains uppercase
set gdefault                " Assume /g flag on :s search
set hidden                  " Allow hidden buffers
set noshowcmd                 " Always show current command
" set regexpengine=2
if has('nvim')
    set inccommand=nosplit
endif
set shortmess=atIcF
set ruler
set nocursorline
"set enc=utf-8
set laststatus=2
set encoding=utf-8
set t_Co=256
set t_ut=
let &t_ut=''
" set sessionoptions=buffers,tabpages,folds
set viewoptions=cursor,folds,slash,unix
"" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
" au BufWinLeave * mksession
" Set command-line history
set history=1000
"set viminfo='1000,%
set undolevels=1500          " Only undo up to 150 times
" Auto read file changes
" Add set -g focus-events on to tmux if using tmux
" set autoread " Stop popup when loading a modified file
" au CursorHold,CursorHoldI * checktime
" au FocusGained,BufEnter * :checktime
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" Set path for directories to search for with gf and find
set path+=**
"set viminfo='1000,%
"set viminfo^=!
set nobk nowb noswf         " Disable backup, swap
set report=0                " Always report when lines are changed
"set showcmd                 " Show incomplete command at bottom right
set scrolloff=5
set splitbelow              " Open new split windows below current
set splitright              " Open new split window right when go vertical"
set fo+=ql
set autoread
" Turn off auto window resizing
set noea
" Include $ in word list
au FileType php        setlocal isk+=$
" au FileType php        set keywordprg=pman
au FileType javascript setlocal isk+=$
" Use OS clipboard
set clipboard+=unnamed,unnamedplus
set vb

" Mappings
" Much easier to type commands this way
"no ; :
" Keep traditional ; functionality
"no \ ;
" Pressing v again brings you out of visual mode

" Show whitespace characters
set list
set listchars=tab:» 
" set listchars=tab:» ,eol:↓
" Default shell
" set sh=zsh
xno v <esc>

" GUI
" ==================================================
"
if has('gui_running')
    set go-=L " egmrLT
    set go-=r
    set go-=T
    if has('gui_gtk2')
        set guifont=Roboto\ Mono\ for\ Powerline\ h15
    elseif has('gui_macvim')
        set guifont=Roboto\ Mono\ for\ Powerline:h15
    endif
endif

" Colors and highlights
" ==================================================
" }}}
"if has('statusline')
"
"  function! ALEWarnings() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf('  W:%d ', all_non_errors)
"  endfunction
"
"  function! ALEErrors() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? '' : printf(' E:%d ', all_errors)
"  endfunction
"
"  function! ALEStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? ' √ ' : ''
"  endfunction
"
"  set laststatus=2
"  set statusline=%<%f
"  set statusline+=%w%h%m%r
"
"  set statusline+=\ %y
"  set statusline+=%=%-14.(%l,%c%V%)\ %p%%\ 
"
"  " set statusline+=\%#StatusLineOk#%{ALEStatus()}
"  " set statusline+=\%#StatusLineError#%{ALEErrors()}
"  " set statusline+=\%#StatusLineWarning#%{ALEWarnings()}
"
"endif

" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
"colorscheme OceanicNext
colorscheme onedark

" Current settings
hi vertsplit gui=none guifg=#424242 guibg=none ctermbg=none cterm=none ctermfg=none
hi LineNr ctermfg=237
hi StatusLine gui=underline guifg=#999999 guibg=none
" hi StatusLineNC gui=underline guifg=#424242 guibg=none
hi StatusLineOk gui=underline guifg=#5FD7A7
hi StatusLineError gui=underline guifg=#fb007a
hi StatusLineWarning gui=underline guifg=#A89C14
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=none
hi FoldColumn guibg=none ctermbg=none cterm=none
hi Folded guibg=none ctermbg=none cterm=none
" inactive statuslines as thin splitlines
highlight! StatusLineNC gui=underline guibg=NONE guifg=#3e4451
" End current settings

" hi SignColumn ctermbg=235
" hi vertsplit ctermfg=238 ctermbg=235
" hi EndOfBuffer ctermfg=237 ctermbg=235
" hi CursorLineNR ctermbg=235

" Transparency
" hi GitGutterAdd ctermbg=none ctermfg=245
" hi GitGutterChange ctermbg=none ctermfg=245
" hi GitGutterDelete ctermbg=none ctermfg=245
" hi GitGutterChangeDelete ctermbg=none ctermfg=245
"hi LineNr ctermbg=none
"hi Normal ctermbg=none
"hi NonText ctermbg=none
"hi EndOfBuffer ctermbg=none
"hi CursorLineNR ctermbg=none

" set statusline=%=%f\ %m[L:%L]
"set fillchars=vert:\ ,stl:\ ,stlnc:\
" Hide INSERT in statusbar
set noshowmode

" Language-specific
" highlight! link elixirAtom rubySymbol
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
" REMOVE EMPTY BUFFERS {{{
function! RemoveEmptyBuffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0 && !getbufvar(v:val, "&mod")')
  if !empty(buffers)
      silent exe 'bw ' . join(buffers, ' ')
  endif
endfunction
" }}}
" Autocommands {{{
" ====================================================================
" augroup vimGeneralCallbacks
  " autocmd!
  " "autocmd BufWritePost .nvimrc nested source ~/.config/nvim/init.vim
" augroup END

" Jump to last edit when opening Vim
au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ | exe "normal! g`\""
    \ | endif

" augroup fileTypeSpecific
  " autocmd!
  " JST support
  " autocmd BufNewFile,BufRead *.ejs set filetype=jst
  " autocmd BufNewFile,BufRead *.jst set filetype=jst
  " autocmd BufNewFile,BufRead *.djs set filetype=jst
  " autocmd BufNewFile,BufRead *.hamljs set filetype=jst
  " autocmd BufNewFile,BufRead *.ect set filetype=jst

  " autocmd BufNewFile,BufRead *.js.erb set filetype=javascript

  " " Gnuplot support
  " autocmd BufNewFile,BufRead *.plt set filetype=gnuplot

  " autocmd FileType jst set syntax=htmldjango
  " au BufNewFile *.php 0r ~/.config/nvim/templates/php/skeleton.php
" augroup END

augroup quickFixSettings
  autocmd!
  autocmd FileType qf
        \ nnoremap <buffer> <silent> q :close<CR> |
        \ map <buffer> <silent> <F4> :close<CR> |
        \ map <buffer> <silent> <F8> :close<CR>
augroup END

if has('nvim')
  augroup terminalCallbacks
    autocmd!
    autocmd TermClose * call feedkeys('<cr>')
  augroup END
endif
"}}}
" Cursor configuration {{{
" ====================================================================
" Use a blinking upright bar cursor in Insert mode, a solid block in normal
" and a blinking underline in replace mode
" if has('nvim')
  "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
  " set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
   " \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
   " \,sm:block-blinkwait175-blinkoff150-blinkon175
" endif
if has('gui_running')
    " Disable cursor blinking in GUI
    let &guicursor = substitute(&guicursor, 'n-v-c:', '&blinkon0-', '')
endif

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Easy window navigation
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-x>k :bdelete<CR>

" Remap number increment
" map <C-c> <C-A>

" Next/Previous buffer
" nmap <A-Left> :bp!<CR>
" nmap <A-Right> :bn!<CR>

" Go to begin/end of line in insert mode
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Turn off highlighted search
nmap <silent> <Leader>nh :nohlsearch<CR>

" {{{ Key mappings

" {{{ FZF
"nnoremap <silent> <leader><space> :Files<CR>
"nnoremap <silent> <leader>a :Buffers<CR>
"nnoremap <silent> <leader>B :Windows<CR>
"nnoremap <silent> <leader>; :BLines<CR>
"nnoremap <silent> <leader>O :Tags<CR>
"nnoremap <silent> <leader>o :BTags<CR>
"nnoremap <silent> <leader>? :History<CR>
"nnoremap <leader>F :F<SPACE>
"nnoremap <leader>/ :Rg<space>
"
"nnoremap <silent> <leader>gl :Commits<CR>
"nnoremap <silent> <leader>ga :BCommits<CR>
"nnoremap <silent> <leader>ft :Filetypes<CR>
"nnoremap <leader>fs :mark '<CR>:FindSymbols<CR>
"nnoremap <leader>ff :mark '<CR>:FindFunctions<CR>
"
"imap <C-x><C-f> <plug>(fzf-complete-file-ag)
"imap <C-x><C-l> <plug>(fzf-complete-line)
" }}}

" {{{ COC
" inoremap <silent><expr> <TAB>
  " \ pumvisible() ? "\<C-n>" :
  " \ <SID>check_back_space() ? "\<TAB>" :
  " \ coc#refresh()
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
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
" nnoremap ge :CocCommand explorer<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>fm  <Plug>(coc-format-selected)
nmap <leader>fm  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>cv  <Plug>(coc-codeaction-selected)
nmap <leader>cv  <Plug>(coc-codeaction-selected)

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
" Coc Yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<CR>
" }}}

" {{{ Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
" nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gE :Gedit<space>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gR :Gread<space>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gW :Gwrite!<CR>
nnoremap <silent> <leader>gq :Gwq<CR>
nnoremap <silent> <leader>gQ :Gwq!<CR>
" }}}

" {{{ GitGutter
nmap <silent> ]h :GitGutterNextHunk<CR>
nmap <silent> [h :GitGutterPrevHunk<CR>
nnoremap <silent> <Leader>gu :GitGutterRevertHunk<CR>
nnoremap <silent> <Leader>gp :GitGutterPreviewHunk<CR><c-w>j
nnoremap cog :GitGutterToggle<CR>
nnoremap <Leader>gt :GitGutterAll<CR>
" }}}

" {{{ JSdoc
nmap <silent> <Leader>d <Plug>(jsdoc)
" }}}

" {{{
"nnoremap <silent> <leader>nn :NnnPicker<CR>
"nnoremap <leader>nd :NnnPicker '%:p:h'<CR>
" }}}

" {{{ Vim Grepper
" nnoremap <leader>g :Grepper -tool rg<cr>
" nnoremap <leader>G :Grepper -tool git<cr>
" nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
" nmap gs  <plug>(GrepperOperator)
" xmap gs  <plug>(GrepperOperator)
" }}}

" {{{ Terminal 
" ====================================================================
nnoremap <silent> <leader><Enter> :tabnew<CR>:terminal<CR>

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

" Open tig
" nnoremap <Leader>gg :tabnew<CR>:terminal tig<CR>

if has('nvim')
  "tnoremap <C-[> <c-\><c-n><esc><cr>
  "tnoremap <F1> <C-\><C-n>
  tnoremap <C-\><C-\> <C-\><C-n>:bd!<CR>
endif

function! TerminalInSplit(args)
  botright split
  execute 'terminal' a:args
endfunction

nnoremap <leader><F1> :execute 'terminal ranger ' . expand('%:p:h')<CR>
nnoremap <leader><F2> :terminal ranger<CR>
augroup terminalSettings
  autocmd!
  autocmd FileType ruby nnoremap <leader>\ :call TerminalInSplit('pry')<CR>
augroup END
" }}}
  
" {{{ Other Key Mappings
nnoremap <leader>vi :tabedit $MYVIMRC<CR>

" Quick way to save file
nnoremap <leader>w :w<CR>

" Y behave like D or C
nnoremap Y y$

" Disable search highlighting
"nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Copy current file path to clipboard
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
function! CopyCurrentFilePath() " {{{
  let @+ = expand('%')
  echo @+
endfunction
" }}}

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Select all text
noremap vA ggVG

" Same as normal H/L behavior, but preserves scrolloff
nnoremap H :call JumpWithScrollOff('H')<CR>
nnoremap L :call JumpWithScrollOff('L')<CR>
function! JumpWithScrollOff(key) " {{{
  set scrolloff=0
  execute 'normal! ' . a:key
  set scrolloff=999
endfunction " }}}

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Creating splits with empty buffers in all directions
nnoremap <Leader>hn :leftabove  vnew<CR>
nnoremap <Leader>ln :rightbelow vnew<CR>
nnoremap <Leader>kn :leftabove  new<CR>
nnoremap <Leader>jn :rightbelow new<CR>

" If split in given direction exists - jump, else create new split
function! JumpOrOpenNewSplit(key, cmd, fzf) " {{{
  let current_window = winnr()
  execute 'wincmd' a:key
  if current_window == winnr()
    execute a:cmd
    if a:fzf
      Files
    endif
  else
    if a:fzf
      Files
    endif
  endif
endfunction " }}}
nnoremap <silent> <Leader>hh :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 0)<CR>
nnoremap <silent> <Leader>ll :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 0)<CR>
nnoremap <silent> <Leader>kk :call JumpOrOpenNewSplit('k', ':leftabove split', 0)<CR>
nnoremap <silent> <Leader>jj :call JumpOrOpenNewSplit('j', ':rightbelow split', 0)<CR>

" Same as above, except it opens unite at the end
nnoremap <silent> <Leader>h<Space> :call JumpOrOpenNewSplit('h', ':leftabove vsplit', 1)<CR>
nnoremap <silent> <Leader>l<Space> :call JumpOrOpenNewSplit('l', ':rightbelow vsplit', 1)<CR>
nnoremap <silent> <Leader>k<Space> :call JumpOrOpenNewSplit('k', ':leftabove split', 1)<CR>
nnoremap <silent> <Leader>j<Space> :call JumpOrOpenNewSplit('j', ':rightbelow split', 1)<CR>

" Remove trailing whitespaces in current buffer
"nnoremap <Leader><BS>s :1,$s/[ ]*$//<CR>:nohlsearch<CR>1G

" Universal closing behavior
"nnoremap <silent> Q :call CloseSplitOrDeleteBuffer()<CR>
"nnoremap <silent> Й :call CloseSplitOrDeleteBuffer()<CR>
"function! CloseSplitOrDeleteBuffer() " {{{
"  if winnr('$') > 1
"    wincmd c
"  else
"    execute 'bdelete'
"  endif
"endfunction " }}}

" Delete all hidden buffers
"nnoremap <silent> <Leader><BS>b :call DeleteHiddenBuffers()<CR>
"function! DeleteHiddenBuffers() " {{{
"  let tpbl=[]
"  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
"  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
"    silent execute 'bwipeout' buf
"  endfor
"endfunction " }}}

" {{{ visual star
xnoremap * :<c-u>let @/=@"<cr>gvy:let [@/,@"]=[@",@/]<cr>/\V<c-r>=substitute(escape(@/,'/\'),'\n','\\n','g')<cr><cr>
" }}}

let g:session_dir = '$HOME/.config/nvim/sessions/'
nnoremap <Leader>sl :wall<Bar>execute "source " . g:session_dir . fnamemodify(getcwd(), ':t')<CR>
nnoremap <Leader>ss :execute "mksession! " . g:session_dir . fnamemodify(getcwd(), ':t')<CR>
" }}}

" End key mappings }}}

" Disable auto-commenting
au FileType * setl fo-=cro

" Avoid vim highlighting curly braces in blocks as errors
let c_no_curly_error = 1

" Lua configs
" ===========================================================
lua <<EOF
require'treesitter.lua'
require'statusline.lua'
require'nvimTree.lua'
-- nvim tree color for folder name and icon
vim.cmd "hi NvimTreeFolderIcon guifg = #61afef"
vim.cmd "hi NvimTreeFolderName guifg = #61afef"
vim.cmd "hi NvimTreeIndentMarker guifg=#383c44"

vim.cmd "hi Normal guibg=NONE ctermbg=NONE"

require'bufferline.lua'
require'colorizer'.setup()
require'indent.lua'

require'gitsigns.lua'
vim.cmd "hi DiffAdd guifg=#81A1C1 guibg = none"
vim.cmd "hi DiffChange guifg =#3A3E44 guibg = none"
vim.cmd "hi DiffModified guifg = #81A1C1 guibg = none"

require'telescope.lua'
-- vim.cmd "hi TelescopeBorder   guifg=#2a2e36"
-- vim.cmd "hi TelescopePromptBorder   guifg=#2a2e36"
-- vim.cmd "hi TelescopeResultsBorder  guifg=#2a2e36"
-- vim.cmd "hi TelescopePreviewBorder  guifg=#525865"
EOF

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
