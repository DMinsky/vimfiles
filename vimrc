" UTF-8 for everyone everywhere!
set encoding=utf8

" always use tabs, do not expand to whitespaces
set noexpandtab
" how many columns of whitespace is a \t char worth? 
set tabstop=4
" how many columns of whitespace a “level of indentation” is worth
set shiftwidth=4
" how many columns of whitespace is a tab keypress or a backspace keypress worth
set softtabstop=4
" somehow smart indentation for c 
set cindent

set background=dark
colorscheme desert
syntax on
set nobackup
set nowritebackup
set backspace=indent,eol,start
set number
set makeprg=build.bat
set errorformat=%f(%l):\ %m

"=== Keyboard bindings ===
let mapleader = ","  " Set a leader key

" Allow to operate in normal mode when russian layout is active
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" No more shift for the command mode in normal mode!
nnoremap ; :
" No more shift for the command mode in visual mode!
vnoremap ; :

map <F9> :make<CR>
map! <F9> <C-o>:make<CR>
noremap <C-s> :update<CR>
noremap <Leader>f :FZF<CR>
