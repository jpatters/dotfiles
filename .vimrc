filetype on

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Defaults
Plug 'tpope/vim-sensible'

" Status Bar
Plug 'vim-airline/vim-airline'

Plug 'tpope/vim-commentary', {
\ 'for': ['javascript', 'typescript', 'vue', 'ruby'] }

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'maksimr/vim-jsbeautify'

" Initialize plugin system
call plug#end()

" Show Line Numbers
set nu

" Leader Key
:let mapleader = ","

" Tab Defaults
set expandtab
set ts=2
set sts=2
set sw=2

" ruby-vim suggestions
set nocompatible
syntax on
filetype indent on
filetype plugin on

" vim-go
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"""""""""""
" BUFFERS "
"""""""""""
" These three functions are for tabbing between and closing buffers.
" If the current file has unsaved changes, those changes will be 
" saved before performing the action.

function! NextBuffer() 
  if &mod
    exec ':w'
  endif
  exec ':bn'
endfunction
nnoremap <tab> :call NextBuffer()<cr>

function! PrevBuffer() 
  if &mod
    exec ':w'
  endif
  exec ':bp'
endfunction
nnoremap <s-tab> :call PrevBuffer()<cr>

function! CloseBuffer() 
  if &mod
    exec ':w'
  endif

  exec ':bd'
endfunction
nnoremap <Leader>w :call CloseBuffer()<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""
" SEARCH "
""""""""""
let g:ackprg = 'ag --vimgrep'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

:nnoremap <leader>o :Files<cr>
:nnoremap <leader>f :Ag<cr>
:nnoremap <leader>b :Buffers<cr>

set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)


" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#run({'source': map(filter(range(1, bufnr('$')), 'buflisted(v:val)'),
  \               'bufname(v:val)'),
  \ 'sink': 'e', 'down': '30%'})

"""""""""""""""""""
" LAST CURSOR POS "
"""""""""""""""""""
"
" Jump to last cursor position unless it's invalid or in an event loop
"
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
\ endif

""""""""
" RUBY "
""""""""

" Convert Condition ,cc
autocmd FileType ruby nnoremap <leader>cc :RConvertPostConditional<cr>

" Autoclose
if !exists( "*CodeEndToken" )

  function CodeEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let brackets_at_end = '[\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'

      if match(current_line, brackets_at_end) >= 0
        return "\<CR>]\<C-O>O"
			elseif match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction

endif

autocmd FileType ruby imap <buffer> <CR> <C-R>=CodeEndToken()<CR>

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Completion
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

