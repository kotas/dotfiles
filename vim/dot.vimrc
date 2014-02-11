set nocompatible
scriptencoding utf-8

"# NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles {{{
NeoBundle 'Shougo/vimproc'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Align'
NeoBundle 'YankRing.vim'
NeoBundle 'yuroyoro/smooth_scroll.vim'
NeoBundle 'eregex.vim'
NeoBundle 'thinca/vim-ref'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'sudo.vim'
NeoBundle 'wincent/Command-T'

NeoBundle 'JavaScript-syntax'
NeoBundle 'jQuery'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'yuroyoro/vim-python'
NeoBundle 'leafgarland/typescript-vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'tsukkee/unite-tag'

NeoBundle 'tomasr/molokai'
" }}}

NeoBundleCheck

"# エンコーディング・行末関連
set encoding=utf-8
set fencs=iso-2022-jp,euc-jp,utf-8,cp932
set fileformats=unix,dos,mac
set textwidth=0

"# ファイル関連
"バックアップとらない
set nobackup
"スワップファイル作らない
set noswapfile
"ファイルが変更されたら読み直す
set autoread
"シンタックスハイライト ON
syntax on
"折りたたみ
set foldmethod=marker
"カレントディレクトリを自動変更
set autochdir

"# 検索関連
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
"ESC2回でハイライト解除
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"マッチを画面中央に表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
"履歴保持件数
set history=1000

"# キーマップ
"leader をスペースに
nnoremap " " <Nop>
let mapleader=" "
"折り返し行に移動
nnoremap j gj
nnoremap k gk
"フレームサイズ変更
nmap > <C-w>>
nmap < <C-w><
nmap + <C-W>+
nmap - <C-W>-
"CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
"F2 で前のバッファ
map <F2> <ESC>:bp<CR>
"F3 で次のバッファ
map <F3> <ESC>:bn<CR>
"F4 でバッファ削除
map <F4> <ESC>:bnext \| bdelete #<CR>
"Shift+U でリドゥ
nnoremap U <C-r>

"# 表示関連
"ステータスバー
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set cmdheight=1
"括弧マッチ
set showmatch
set matchpairs+=<:>
"コマンド表示
set showcmd
"モード表示
set showmode
"全角スペースハイライト
augroup highlightZenkakuSpace
  autocmd!
  autocmd ColorScheme * highlight ZenkakuSpace cterm=underline ctermbg=darkgreen guibg=darkgreen
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
"カーソル行ハイライト
set cursorline
"カレントウィンドウのみ
augroup highlightCursorLine
  autocmd!
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
  autocmd ColorScheme * highlight clear CursorLine
  autocmd ColorScheme * highlight CursorLine ctermbg=black guibg=black
augroup END
"不可視文字
set list
set listchars=tab:>\ ,trail:\ ,extends:<,precedes:>,nbsp:%
augroup highlighListChars
  autocmd!
  autocmd ColorScheme * highlight clear SpecialKey
  autocmd ColorScheme * highlight SpecialKey ctermfg=black guibg=#222222
augroup END
"コマンド実行中の再描画抑制
set lazyredraw
"高速TTY
set ttyfast
"スクロールに余裕をもたせる
set scrolloff=5
"カラースキーマ
colorscheme molokai

"# 補完
set wildmenu
set wildchar=<tab>
set wildmode=longest:full
"辞書を補完に追加
set complete+=k
"XML 閉じタグ補完
augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

"# インデント関連
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"行末行頭を超えてカーソル移動
set whichwrap+=h,l,<,>,[,],b,s,~
"バックスペースで色々消せるように
set backspace=indent,eol,start
"ファイルタイプ別デフォルトインデント設定
filetype plugin on
filetype indent on
" ファイルタイプ別 {{{
autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType xhtml      setlocal sw=2 sts=2 ts=2 et
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
" }}}

"# Tags 関連
if has("autochdir")
  set autochdir
  set tags=tags;
else
  set tags=./tags,./../tags,./*/tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags
endif
set notagbsearch

"# 各種 Bundle の設定
source ~/.vimrc.bundles

