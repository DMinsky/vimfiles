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
" enable syntax highlighting
syntax on

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

" === KITTY SUPPORT =============================================================
" More info here https://sw.kovidgoyal.net/kitty/faq/
if &term == 'xterm-kitty'
	" Mouse support
	set mouse=a
	set ttymouse=sgr
	set balloonevalterm
	" Styled and colored underline support
	let &t_AU = "\e[58:5:%dm"
	let &t_8u = "\e[58:2:%lu:%lu:%lum"
	let &t_Us = "\e[4:2m"
	let &t_Cs = "\e[4:3m"
	let &t_ds = "\e[4:4m"
	let &t_Ds = "\e[4:5m"
	let &t_Ce = "\e[4:0m"
	" Strikethrough
	let &t_Ts = "\e[9m"
	let &t_Te = "\e[29m"
	" Truecolor support
	let &t_8f = "\e[38:2:%lu:%lu:%lum"
	let &t_8b = "\e[48:2:%lu:%lu:%lum"
	let &t_RF = "\e]10;?\e\\"
	let &t_RB = "\e]11;?\e\\"
	" Bracketed paste
	let &t_BE = "\e[?2004h"
	let &t_BD = "\e[?2004l"
	let &t_PS = "\e[200~"
	let &t_PE = "\e[201~"
	" Cursor control
	let &t_RC = "\e[?12$p"
	let &t_SH = "\e[%d q"
	let &t_RS = "\eP$q q\e\\"
	let &t_SI = "\e[5 q"
	let &t_SR = "\e[3 q"
	let &t_EI = "\e[1 q"
	let &t_VS = "\e[?12l"
	" Focus tracking
	let &t_fe = "\e[?1004h"
	let &t_fd = "\e[?1004l"
	execute "set <FocusGained>=\<Esc>[I"
	execute "set <FocusLost>=\<Esc>[O"
	" Window title
	let &t_ST = "\e[22;2t"
	let &t_RT = "\e[23;2t"

	" vim hardcodes background color erase even if the terminfo file does
	" not contain bce. This causes incorrect background rendering when
	" using a color theme with a background color in terminals such as
	" kitty that do not support background color erase.
	let &t_ut=''
endif " if &term == 'xterm-kitty'

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
Plug 'DMinsky/jai.vim'
Plug 'DMinsky/asmM6502vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'DMinsky/vim-colors-solarized'
if has('python3')
	Plug 'SirVer/ultisnips'
endif

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


if &term != 'win32'
	" only for the console, overriden in gvimrc for the gVim
	colorscheme solarized
	" highlight a line where the cursor is
	set cursorline
endif
