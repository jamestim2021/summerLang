source $VIMRUNTIME/vimrc_example.vim

"" Set leader
let mapleader="," 
let g:mapleader=","

set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936,gb18030
set tabstop=4

set nocompatible                " 关闭 vi 兼容模式
syntax on                       " 语法高亮
set nu                          " 开启行号
set nocursorline                " 不突出显示当前行
set shiftwidth=4                " 设置 << 和 >> 移动时的宽度
set softtabstop=4               " 退格一次可以删除 4 个空格
set autochdir                   " 自动切换当前工作目录为文件所在目录
set ignorecase smartcase        " 搜索关键字为全小写时忽略大小写，有一个以上的大写字母仍大小写敏感
set hlsearch                    " 搜索时高亮被搜索文本
set noerrorbells                " 关闭错误信息铃声
set novisualbell                " 关闭可视替代铃声
set showmatch                   " 输入括号是短暂的跳到被匹配的括号
set matchtime=2                 " 短暂跳转的时间
set magic                       " 显示括号匹配情况
set hidden                      " 未保存时由 VIM 帮助保存
set smartindent                 " 开启新行时使用自动缩进
set laststatus=1                " 显示状态栏
set background=dark             " 背景
set tags=tags;                   " 设置 Ctag ';' 很重要，告诉 VIM 从当前目录找 tags，如果没找到就到上级目录寻找

set listchars=tab:>-,trail:-
set list                        " 显示制表符和空格

set foldexpr=1                  " 代码块折叠后显示行数

set nobackup
set expandtab                   " tab 用 空格代替

" 编辑 VIM 配置文件
set fileformats=unix,dos,mac
nnoremap <Leader>e :tabnew $HOME/.vimrc<CR>
let $VIM_HOME = $HOME.'/.vim'

"" 配置缓冲区快捷键
nnoremap  [b :bprevious<CR>
nnoremap  ]b :bnext<CR>
nnoremap  [B :bfirst<CR>
nnoremap  ]B :blast<CR>



" 不同文件的缩进
au FileType php setl shiftwidth=2
au FileType php setl tabstop=2



" Save undo dir
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
    elseif &filetype=="python"
        exec "!python %"
	else
		echo "no available quick run config"
	endif
endfunc


hi comment ctermfg=6
