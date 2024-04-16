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
" show cursor column and line
set ruler

" allow backspacing at the indentation, end of the line and the start of the line
" so it basically behaves as a normal backspace in a normal text editor
set backspace=indent,eol,start

" cos we're a pro hatzker
set background=dark
" only for the console, overriden in gvimrc for the gVim
colorscheme solarized
" enable syntax highlighting
syntax on
" highlight a line where the cursor is
set cursorline

" do not save backup files
set nobackup      

" use build.bat file in current directory as a default 'make tool'
set makeprg=build.bat\ %
" this should be cl compiler error message format
set errorformat=%f(%l):\ %m

" ingnore case when search by default
set ignorecase
" but consider casing where capital letters are present
set smartcase

" shole line numbers on the left
set number

" to avoid 'press ENTER ...' after !cmd
set cmdheight=2
" Disable damn bell sound on error and do flash instead
set visualbell


"=== Keyboard bindings =========================================================

" Set a leader key
let mapleader = ","  

" Allow to operate in normal mode when russian layout is active
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

noremap <C-s> :update<CR>
noremap <F9> :!build <C-R>=expand('%')<CR><CR>
inoremap <F5> <C-c>:w<CR>:!build <C-R>=expand('%')<CR> && run <C-R>=expand('%')<CR><CR>
noremap <F5> <C-c>:w<CR>:!build <C-R>=expand('%')<CR> && run <C-R>=expand('%')<CR><CR>
noremap <C-F5> :!<c-r>=expand('%:r')<CR><CR>
noremap <S-F5> :!remedybg <c-r>=expand('%:r')<CR><CR>
noremap <C-s> :update<CR>

noremap <Leader>f :Files<CR>
nnoremap <Leader>r :Rg <C-R><C-W><CR>
nnoremap <Leader>R :Rg<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>t :Tags<CR>
noremap <Leader>m :Marks<CR>

noremap <Leader>n :set number relativenumber!<CR>
noremap <Leader>l :set list!<CR>

noremap <silent> [b :bprevious!<CR>
noremap <silent> ]b :bnext!<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"===============================================================================


" === PLUGINS ==================================================================
"
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jansedivy/jai.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
" ==============================================================================

" UltiSnips configuration
"
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
