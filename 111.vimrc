set nocompatible               " Be iMproved

if has('vim_starting')
     set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'hdima/python-syntax'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'majutsushi/tagbar'
NeoBundle 'godlygeek/tabular'
NeoBundle 'mbbill/echofunc'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'https://bitbucket.org/sjl/gundo.vim'

 filetype plugin indent on     " Required!
" Installation check.
NeoBundleCheck



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""            
" => Colors & Fonts & Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized 
"colorscheme yytextmate

" Highlight current
set cursorline
set cursorcolumn
hi cursorline guibg=#222222
hi CursorColumn guibg=#333333
" Toggle Menu and Toolbar and switch fullscreen mode
"set guioptions-=b " Hide bottom scrollbar
"set guioptions-=R " Hide right scrollbar
set guioptions-=r 
"set guioptions-=l " Hide left scrollbar
set guioptions-=L
"set guioptions-=m " Hide Menu
"set guioptions-=T " Hide Toolbar
"map <silent> <F11> :if &guioptions =~# 'm' <Bar>
"            \set guioptions-=m <bar>
"            \else <Bar>
"            \set guioptions+=m <Bar>
"            \endif<cr>
" Auto Maximize when vim starts.

set foldenable

set ofu=syntaxcomplete#Complete
set paste
set so=7

" Turn on WiLd menu
set wildmenu
set wildmode=longest,full
set wildignore=*.bak,*.o,*.e,*~,*.pyc,*.svn,*.beam
" Always show current position
set ruler
" The commandbar is 2 high
set cmdheight=2
" Show line number
set number
" Highlight search things
set hlsearch
set incsearch
set ic
" Turn backup off
set nobackup
set nowb
set noswapfile

" Text options
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set FileEncodeing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fencs=utf-8,gbk,chinese,latin1
set formatoptions+=mM
set nobomb " Don' use Unicode 
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My information
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
set tags=tags

"Set to auto read when a file is changed from the outside
set autoread

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%F\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
set laststatus=2  " 显示状态栏 (默认值为 1, 无法显示状态栏)

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai
"Smart indet
set si
"C-style indeting
set cindent

" Set mapleader 
let mapleader = ","
let g:mapleader = ","

" New Python file template
autocmd bufnewfile *.py call setline(1,'#!/usr/bin/env python') |
  \ call setline(2,'#coding:utf-8') |
  \ call setline(4,'') |
  \ call setline(5,'') |
  \ exe "normal G"

"Super paste
ino <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  if filereadable("cscope.out")
    cs add cscope.outside
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
  set cscopetag
  set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
endif

" NERD_tree.vim
map <leader>n :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.pyc$','\.svn$','\.tmp$','\.bak','\~$']

map <leader>t :TagbarToggle<cr>
nmap <F8> :TagbarToggle<CR>

set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType htm set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c,cpp,java,cs set omnifunc=ccomplete#Complete

"QUICKFIX
map <leader>lv :lv /\<<C-R>=expand("<cword>")<cr>\>/j **/*.erl<cr>:lw<cr>
  "find all contain
map <leader>ll :lv /<C-R>=expand("<cword>")<cr>/j **/*.erl<cr>:lw<cr>
"find definition
map <leader>ld :lv /\<class\>\s\+\<<C-R>=expand("<cword>")<cr>\>\\|\<def\>\s\+\<<C-R>=expand("<cword>")<cr>\>/ **/*.erl<cr>llllll
"find occurence
map <leader>lo :lv /\.\<<C-R>=expand("<cword>")<cr>\>/j **/*.erl<cr>:lw<cr>
"find assign
map <leader>la :lv /\<<C-R>=expand("<cword>")<cr>\>\s*=/j **/*.erl<cr>:lw<cr>
map <silent><leader>lw :lw<cr>
map <silent><leader>lcl :lcl<cr>
"location list
map <silent><leader>lne :lne<cr>
map <silent><leader>lp :lp<cr>
map <silent><leader>lnf :lnf<cr>

map <leader>g :vimgrep // **/*.erl<left><left><left><left><left><left><left><left><left><left>
map <leader>e /error <cr>
map <leader>m /my_print<cr>

map <F6> :!erlc +debug_info  -I ./include/ -o ./ebin %<cr>
map <F2> :tabn<cr>

syntax on

" No sound on errors.
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

set autoread

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.erlang = '[^. *\t]:\w*'

set t_Co=256

set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

