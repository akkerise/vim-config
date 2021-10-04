" {{{
  function! LightlineFilename()
    return expand('%:.') !=# '' ? expand('%:.') : '[No Name]'
  endfunction
" }}}

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