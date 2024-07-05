" Defold lua
au BufNewFile,BufRead *.script			setf defold
au BufNewFile,BufRead *.script			set syntax=lua
au BufNewFile,BufRead *.gui_script			setf defold
au BufNewFile,BufRead *.gui_script			set syntax=lua
autocmd FileType defold setlocal commentstring=--\ %s
