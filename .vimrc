"========================= linux下用的配置文件============================
" DesCription: My vimrc
"
" Last Change: 2014 03 24
"
" Version: 1.1
"=========================================================================


"=========================================================================
" DesCription: Vim Bundle (vundle)
"
" Function: manage vim plugin
"
" https://github.com/gmarik/vundle
"=========================================================================
set nocompatible						" 关闭 vi 兼容模式
filetype off							" required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:
"
" original repos on GitHub
Bundle 'gmarik/vundle'
Bundle 'jimenezrick/vimerl'
Bundle 'godlygeek/tabular'

" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'

" non-GitHub repos
" Bundle 'git://git.wincent.com/command-t.git'

" Git repos on local machine
Bundle 'file:///home/chris/.vim/bundle/PHP-Identing-for-Vim'

"
" Brief help
" :BundleList			- list configured bundles
" :BundleInstall(!)		- install (update) bundles
" :BundleSearch(!) foo	- search (or refresh cache first) for foo
" :BundleClean(!)		- confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bunder commands are not allowed.
"=============================== Bundle End ==============================


filetype plugin indent on					" 开启插件 required!
colorscheme mycolor                         " 设定配色方案 torte also perfert
syntax on									" 自动语法高亮
set number									" 显示行号
set cursorline								" 突出显示当前行
set ruler									" 打开状态栏标尺
set expandtab								" 设定 tab 为 4 个空格
set shiftwidth=4							" 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4							" 使得按退格键时可以一次删掉 4 个空格
set tabstop=4								" 设定 tab 长度为 4
set smarttab                                " 根据文中其他地方缩进的空格个数来判断tab是多少个空格键
set nobackup								" 覆盖文件时不备份
set backupcopy=yes							" 设置备份时的行为为覆盖
set nowrapscan								" 禁止在搜索到文件两端时重新搜索
set incsearch								" 输入搜索内容时就显示搜索结果
set hlsearch								" 搜索时高亮显示被找到的文本
set noerrorbells							" 关闭错误信息响铃
set novisualbell							" 关闭使用可视响铃代替呼叫
set t_vb=									" 置空错误铃声的终端代码
set magic									" 设置魔术
set hidden									" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T							" 隐藏工具栏
set guioptions-=m							" 隐藏菜单栏
set smartindent								" 开启新行时使用智能自动缩进
set backspace=indent,eol,start				" 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1								" 设定命令行的行数为 1
set laststatus=2							" 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
                                            " 设置在状态行显示的信息

" 折叠设置
set foldmethod=manual						" 设置语法折叠
set foldcolumn=1							" 设置折叠区域的宽度
"set foldenable						        " 开启折叠
"set foldclose=							" 设置为自动关闭折叠 
"let erlang_folding=1						" 开启 erlang 折叠
setlocal foldlevel=1						" 设置折叠层数为
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"set autochdir   							" 自动切换当前目录为当前文件所在的目录
											" 用空格键来开关折叠
                                            
"全局替换配置
let mapleader = ","
let g:mapleader = ","
map <leader>g :vimgrep // **/*.erl<left><left><left><left><left><left><left><left><left><left>

"-----------------------------------------------------------------
" plugin - Tabular.vim 对齐插件
"-----------------------------------------------------------------
"vmap idc :Tabularize /,
"vmap ids :Tabularize /\/\/
"vmap ide :Tabluarize /=>


" 设定vim文件目录, doc文档目录
let $VIMFILES = $HOME.'/.vim'
let helptags=$VIMFILES.'/doc'

" " 配置多语言环境
" if has("multi_byte")
" 	" UTF-8 编码
set encoding=utf-8
" 	set termencoding=utf-8
" 	set formatoptions+=mM
" 	set fencs=utf-8,gbk
" 
" 	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
" 		set ambiwidth=double
" 	endif
" 
" 	if has("win32")
" 		source $VIMRUNTIME/delmenu.vim
" 		source $VIMRUNTIME/menu.vim
" 		language messages zh_CN.utf-8
" 	endif
" else
" 	echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
" endif

" Buffers操作快捷方式!
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的
"时候会变得非常方便.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" set fileformats=unix,dos,mac
" nmap <leader>fd :se fileformat=dos<CR>
" nmap <leader>fu :se fileformat=unix<CR>

" use Ctrl+[l|n|p|cc] to list|next|previous|jump to count the result
" map <C-x>l <ESC>:cl<CR>
" map <C-x>n <ESC>:cn<CR>
" map <C-x>p <ESC>:cp<CR>
" map <C-x>c <ESC>:cc<CR>

"-----------------------------------------------------------------
" plugin - taglist.vim 查看函数列表，需要ctags程序
" F4 打开隐藏taglist窗口
"-----------------------------------------------------------------
let Tlist_Ctags_Cmd = '/usr/bin/ctags'

nnoremap <silent><F4> :TlistToggle<CR>
let Tlist_Show_One_File = 1 " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1 " 在右侧窗口中显示taglist窗口
let Tlist_File_Fold_Auto_Close=1 " 自动折叠当前非编辑文件的方法列表
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Process_File_Always = 1
let Tlist_Display_Prototype = 0
let Tlist_Compact_Format = 1


"-----------------------------------------------------------------
" plugin – checksyntax.vim JavaScript常见语法错误检查
" 默认快捷方式为 F5
"-----------------------------------------------------------------
let g:checksyntax_auto = 0                  " 不自动检查


"-----------------------------------------------------------------
" plugin - NeoComplCache.vim 自动补全插件
"-----------------------------------------------------------------
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-e> <Plug>(neocomplcache_snippets_expand)
