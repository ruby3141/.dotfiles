if has('nvim')
  if exists('g:vscode')
    " VSCode extension
    lua vscode = require('vscode')
    lua vim.g.clipboard = vim.g.vscode_clipboard

    " prevent ftplugin to mess up
    filetype plugin off
    filetype indent on

    nnoremap zM <Cmd>lua vscode.call('editor.foldAll')<CR>
    nnoremap zR <Cmd>lua vscode.call('editor.unfoldAll')<CR>
    nnoremap zc <Cmd>lua vscode.call('editor.fold')<CR>
    nnoremap zC <Cmd>lua vscode.call('editor.foldRecursively')<CR>
    nnoremap zo <Cmd>lua vscode.call('editor.unfold')<CR>
    nnoremap zO <Cmd>lua vscode.call('editor.unfoldRecursively')<CR>
    nnoremap za <Cmd>lua vscode.call('editor.toggleFold')<CR>

    vnoremap zM <Cmd>lua vscode.call('editor.foldAll')<CR>
    vnoremap zR <Cmd>lua vscode.call('editor.unfoldAll')<CR>
    vnoremap zc <Cmd>lua vscode.call('editor.fold')<CR>
    vnoremap zC <Cmd>lua vscode.call('editor.foldRecursively')<CR>
    vnoremap zo <Cmd>lua vscode.call('editor.unfold')<CR>
    vnoremap zO <Cmd>lua vscode.call('editor.unfoldRecursively')<CR>
    vnoremap za <Cmd>lua vscode.call('editor.toggleFold')<CR>

    function! MoveCursorNormal(direction) abort
      if(reg_recording() == '' && reg_executing() == '')
          return 'g'.a:direction
      else
          return a:direction
      endif
    endfunction

    nmap <expr> k MoveCursorNormal('k')
    nmap <expr> j MoveCursorNormal('j')
    nmap <expr> <up> MoveCursorNormal('k')
    nmap <expr> <down> MoveCursorNormal('j')

    nnoremap h <Cmd>lua vscode.action('editor.unfold')<CR>h
    nnoremap l <Cmd>lua vscode.action('editor.unfold')<CR>l
    nnoremap <left> <Cmd>lua vscode.action('editor.unfold')<CR>h
    nnoremap <right> <Cmd>lua vscode.action('editor.unfold')<CR>l

    vnoremap h <Cmd>lua vscode.action('editor.unfold')<CR>h
    vnoremap l <Cmd>lua vscode.action('editor.unfold')<CR>l
    vnoremap <left> <Cmd>lua vscode.action('editor.unfold')<CR>h
    vnoremap <right> <Cmd>lua vscode.action('editor.unfold')<CR>l

    nnoremap <silent><C-a> <Cmd>lua vscode.call('editor.action.selectAll')<CR>
    vnoremap <silent><C-a> <Cmd>lua vscode.call('editor.action.selectAll')<CR>

    nnoremap <silent>u <Cmd>lua vscode.call('undo')<CR>
    nnoremap <silent><C-z> <Cmd>lua vscode.call('undo')<CR>
    nnoremap <silent><C-S-z> <Cmd>lua vscode.call('redo')<CR>
    nnoremap <silent><C-r> <Cmd>lua vscode.call('redo')<CR>

    vnoremap <silent>u <Cmd>lua vscode.call('undo')<CR>
    vnoremap <silent><C-z> <Cmd>lua vscode.call('undo')<CR>
    vnoremap <silent><C-S-z> <Cmd>lua vscode.call('redo')<CR>
    vnoremap <silent><C-r> <Cmd>lua vscode.call('redo')<CR>

  else
    " ordinary Neovim

    colorscheme vim

    nnoremap <silent><C-a> gg0vG$
    vnoremap <silent><C-a> <Esc>gg0vG$
    inoremap <silent><C-a> <Esc>gg0vG$

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

" Line number
set number

" No highlight for search result
set nohlsearch

" Use system clipboard
set clipboard^=unnamed,unnamedplus

" prevent d and p(overwrite) from modifying clipboard
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP

" show bracket pair, including <>
set showmatch
set matchpairs+=<:>

" prevent formatter plugin from adding comment prefix automatically
autocmd OptionSet formatoptions set formatoptions-=c formatoptions-=r formatoptions-=o
