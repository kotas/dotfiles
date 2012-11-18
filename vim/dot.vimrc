scriptencoding utf-8
syntax on

"# エンコーディング・行末関連
set encoding=utf-8
set fencs=utf-8,euc-jp,iso-2022-jp,cp932
set fileformats=unix,dos,mac

"# インデント関連
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"幅が不明な文字は2文字幅扱い
set ambiwidth=double
"タブの左側にカーソル
set listchars=tab:\ \ 
set list
"行末行頭を超えてカーソル移動
set whichwrap+=h,l,<,>,[,],b,s,~

"# 検索関連
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
"マッチを画面中央に表示
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

"# キーマップ
"折り返し行に移動
nnoremap j gj
nnoremap k gk
"フレームサイズ変更
map <kPlus> <C-W>+
map <kMinus> <C-W>-

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

