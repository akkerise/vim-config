
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL SETTINGS <tanXnat>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

let g:mapleader = "\<Space>"
" Autoinstall vim-plug 
" {{{
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
  endif
" }}}

call plug#begin('~/.config/nvim/plugged') " Plugins initialization start {{{
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end() 

" Plugins initialization finished {{{
nnoremap <silent><Leader>vp :vsplit<CR>
nnoremap <silent><Leader>sp :split<CR>
nnoremap <silent><Leader>ns :nohlsearch<CR>

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
	execute 'source' setting_file
endfor
