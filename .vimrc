source $VIMRUNTIME/vimrc_example.vim

set nobackup
set nu

set undodir=~/.vim/undodir
if !isdirectory(&undodir)
	call mkdir(&undodir, 'p', 0700)
endif


" Quick Run

nnoremap <F5> :call QuickRun()<CR>

func! QuickRun()
	exec "w"
	if &filetype=="scheme"
		exec "!scheme --script %"
	elseif &filetype=="sh"
		exec "!bash %"
	elseif &filetype=="php"
		exec "!php -f %"
	else
		echo "no available quick run config"
	endif
endfunc


hi comment ctermfg=6
