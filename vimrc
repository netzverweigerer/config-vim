syn on
set title
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
set bg=dark
ca Wq wq
ca WQ wq

set shortmess+=I
set vb t_vb=""
set fileformat=unix
set notextauto
set smartindent

" set tabstop=4
" " set shiftwidth=4

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

" Show trailing tabs and spaces (|---)
" match CursorLine /^\s\+/
set listchars=tab:¦-,trail:\ ,extends:#
set list

" autocmd BufEnter * let &titlestring = "vim: " . hostname() . " (" . expand("%:t") . ")"
autocmd BufEnter * let &titlestring = "VIM " . expand("%:t") . " [" . expand($USER) . "@" . hostname() . "]"
" autocmd BufEnter * let &titlestring = "VIM " . expand("%t") . " [" . expand($USER) . "@" . hostname() . "]"

" set number
" colorscheme armin
colorscheme ron

" set mouse=a





