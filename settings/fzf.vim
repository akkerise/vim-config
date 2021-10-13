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
nnoremap <silent><leader>hh :History:<CR>
nnoremap <silent><leader>T :Tags<CR>
nnoremap <silent><leader>t :BTags<CR>
nnoremap <leader>F :F<SPACE>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <silent> \ :Rg<CR>
" nnoremap <silent>/ :Rg<space>

nnoremap <silent> <leader>c :Commits<CR>
nnoremap <silent> <leader>gc :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>
nnoremap <leader>fs :mark '<CR>:FindSymbols<CR>
nnoremap <leader>ff :mark '<CR>:FindFunctions<CR>
nnoremap <silent><Leader>bd :bd<CR>
nnoremap <silent><Leader>bn :bn<CR>
nnoremap <silent><Leader>bp :bp<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
" }}}
