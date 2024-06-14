if has('nvim')
  if exists('g:vscode')
    " VSCode extension
    nnoremap <C-c> <Cmd>lua require('vscode').call('editor.action.clipboardCopyAction')<CR>
    vnoremap <C-c> <Cmd>lua require('vscode').call('editor.action.clipboardCopyAction')<CR>
    nnoremap <C-c> <Cmd>lua require('vscode').call('editor.action.clipboardCopyAction')<CR>
    nnoremap y <Cmd>lua require('vscode').call('editor.action.clipboardCopyAction')<CR>
    vnoremap y <Cmd>lua require('vscode').call('editor.action.clipboardCopyAction')<CR><Esc>
    nnoremap x <Cmd>lua require('vscode').call('editor.action.clipboardCutAction')<CR>
    vnoremap x <Cmd>lua require('vscode').call('editor.action.clipboardCutAction')<CR><Esc>
    nnoremap p <Cmd>lua require('vscode').call('editor.action.clipboardPasteAction')<CR>
    vnoremap p <Cmd>lua require('vscode').call('editor.action.clipboardPasteAction')<CR>
    nnoremap P <Cmd>lua require('vscode').call('editor.action.clipboardPasteAction')<CR>
    vnoremap P <Cmd>lua require('vscode').call('editor.action.clipboardPasteAction')<CR>

  else
    " ordinary Neovim

  endif

  nnoremap <silent><A-up> :silent! move -2<CR>
  nnoremap <silent><A-down> :silent! move +1<CR>
  inoremap <silent><A-up> <Esc>:silent! move -2<CR>a
  inoremap <silent><A-down> <Esc>:silent! move +1<CR>a
  vnoremap <silent><A-up> :<C-u>silent! '<,'>move '<--<CR>gv
  vnoremap <silent><A-down> :<C-u>silent! '<,'>move '>+<CR>gv

else
  " for not-neo Vim

endif

" ---------------- common ------------------

" No highlight for search result
set nohlsearch

" Use system clipboard
set clipboard^=unnamed,unnamedplus

" prevent d and p(overwrite) from modifying clipboard
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP
