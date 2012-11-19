syn on
set title
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
set bg=dark
ca Wq wq
ca WQ wq

set modeline

set shortmess+=I

set vb t_vb=""

set fileformat=unix
set notextauto

set smartindent

" set tabstop=4
" " set shiftwidth=4

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab


" Automatisches Bearbeiten von gpg verschlüsselten Dateien.
" Placed Public Domain by Wouter Hanegraaff
" (asc support and sh -c"..." added by Osamu Aoki)
augroup aencrypted
au!
" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre *.asc set viminfo=
" We don't want a swap file, as it writes unencrypted data to disk
autocmd BufReadPre,FileReadPre *.asc set noswapfile
" Switch to binary mode to read the encrypted file
autocmd BufReadPre,FileReadPre *.asc set bin
autocmd BufReadPre,FileReadPre *.asc let ch_save = &ch|set ch=2
autocmd BufReadPost,FileReadPost *.asc '[,']!sh -c "gpg --decrypt 2> /dev/null"
" Switch to normal mode for editing
autocmd BufReadPost,FileReadPost *.asc set nobin
autocmd BufReadPost,FileReadPost *.asc let &ch = ch_save|unlet ch_save
autocmd BufReadPost,FileReadPost *.asc execute ":doautocmd BufReadPost " . expand("%:r")
" Convert all text to encrypted text before writing
autocmd BufWritePre,FileWritePre *.asc '[,']!sh -c "gpg --default-recipient-self -ae 2>/dev/null"
" Undo the encryption so we are back in the normal text, directly
" after the file has been written.
autocmd BufWritePost,FileWritePost *.asc u
augroup END


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


