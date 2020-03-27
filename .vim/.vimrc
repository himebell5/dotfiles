" ===========================================================
" # .vimrc General Config
" ===========================================================

" =============== Load vimplug ================
" 設定ファイル.plugins.vimを読み込む
source ~/.vim/.plugins.vim

" ================ Basic settings ================
"vi互換をオフ。いらなくなったらしい?
set nocompatible

" syntax highlightで構文チェック
" コマンド ":syntax enable" は現在の色設定を変更しない。使用する前後にコマンド ":highlight" で好みの色を設定することができる。現在の設定を破棄して、デフォルトの色を設定させたい場合は、":syntax on"
syntax enable

" エンコーディング 文字コードをUTF-8に設定
set encoding=UTF-8
set fileencoding=UTF-8
set termencoding=UTF-8

" font設定
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

" .viminfoをホームディレクトリに置きたくないための処置。
set viminfo+=n~/.vim/.viminfo

" ================ View ================
" タイトルを表示する
set title
" 行番号を表示
set number
" 現在の行を示す
set ruler
" タブや改行を表示 (list:表示)
set nolist
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ
set cmdheight=2
" 入力中のコマンドをステータスに表示する
set showcmd
" モードを表示する
set showmode
" カーソル行をハイライト
set cursorline
" カーソル位置のカラムの背景色を変える
set cursorcolumn
" 挿入モードの時のみ、カーソル行をハイライトする
"autocmd InsertEnter,InsertLeave * set cursorline!
" カーソルの点滅を無効にする
set gcr=a:blinkon0

" ================ Color ================
" ターミナルの背景色をそのまま適用したいのにという時透過させる。
"autocmd ColorScheme * highlight Normal ctermbg=none
" 行番号の色
autocmd ColorScheme * highlight LineNr ctermbg=none

" カラースキームの適用 gruvbox/monokai/molokai/hybrid/ayu
set background=dark
colorscheme ayu
let g:ayu_termtrans=1
let g:rehash256 = 1

" ================ Files ================
" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように。vimは他のすべてのエディターと同じように動作し、バッファーはウィンドウ内になくてもバックグラウンドで存在できる
set hidden
" ターミナル接続を高速化
set ttyfast

" ================ Turn Off Swap Files ================
" バックアップファイルを作らない
"set nobackup
" スワップファイルを作らない
set noswapfile
" wbを作らない？
set nowb

" ---------- Backups
" 指定したディレクトリの下に保存したファイルの、前のバージョンのファイルを自動的にバックアップする。間違って保存しちゃった！って時、このファイルをリネームすれば、保存前のデータを復旧することができる。
set backup
set backupdir	=$HOME/.vim/backup
set backupext	=-vimbackup
set backupskip	=

" ---------- Persistent Undo
" ファイルに保存することにより、セッション間でアンドゥ履歴を保持(常時)
set undofile
set undodir		=$HOME/.vim/backup


" ================ Edit ================
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音すべてを無効にする
set visualbell t_vb=
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
" 全角括弧関連
set matchpairs+=「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 行末の空白文字をハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" 行末の余分なスペースを保存するときに取り除く
"autocmd BufWritePre * :%s/\s\+$//ge

" ================ Indentation & Tab ================
" タブをスペースに展開する/ しない (expandtab:展開する)
set expandtab
" 行頭の前で <Tab> を押した時, 'shiftwidth' 分のスペースが挿入される
"set smarttab
" 不可視文字を可視化(タブが「▸-」と表示される)
set list
set listchars=tab:▸-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅(自動インデントでずれる幅)改行した時など
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" indentを全て有効化
filetype plugin on
filetype indent on
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"set smartindent

" ================ Folds ================
" 折畳方法
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion ================
" コマンドラインの補完<Tab>
set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" コマンドラインの履歴を10000件保存する
set history=10000

" ================ Scrolling ================
" 上下8行の視界を確保(スクロールする時に下が見えるようにする)
set scrolloff=8
" 左右スクロール時の視界を確保
set sidescrolloff=16
" 左右スクロールは一文字づつ行う
set sidescroll=1

" ================ Search ================
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch       " Find the next match as we type the search
" 検索語をハイライト表示
set hlsearch        " Highlight searches by default
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase      " Ignore case when searching...
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase       " ...unless we type a capital
" 置換の時 g オプションをデフォルトで有効にする
set gdefault
" 検索時に最後まで行ったら最初に戻る
set wrapscan

" ================ ClipBoard & Paste ================
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
set pastetoggle=<F12>
" マウスの入力を受け付ける
set mouse=a

" ペーストに関する設定(自動インデントしないように)
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" tags
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" ================ Mappings ================
" 行が折り返されている時(set wrap)j kキーによる上下移動が論理行単位ではなく表示行単位で行われるようにする。逆に論理行単位で移動したい場合は、gj, gk
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k

" ウィンドウ間を移動
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l

" インサートモードでも移動
inoremap <silent><C-h> <left>
inoremap <silent><C-j> <down>
inoremap <silent><C-k> <up>
inoremap <silent><C-l> <right>
inoremap <silent><C-d> <delete>

" 行を移動
nnoremap <silent><C-Up> "zdd<Up>"zP
nnoremap <silent><C-Down> "zdd"zp

" 複数行を移動
vnoremap <silent><C-Up> "zx<Up>"zP`[V`]
vnoremap <silent><C-Down> "zx"zp`[V`]

" 貼り付けたテキストの末尾へ自動的に移動する(nvモード)
noremap <silent> y y`]
noremap <silent> p p`]

" x,Xでカーソル文字を削除する際レジスタを汚さない(nvモード)
noremap x "_x
noremap X "_X

" s,Sでカーソル文字を削除する際レジスタを汚さない(nvモード)
noremap s "_s
noremap S "_S

" 検索後に「次の（前の）検索候補」を画面の中心に表示する
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" 閉じ括弧自動保管
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" Yでカーソル位置から行末までヤンク(vim内でのコピー)する
nnoremap <silent>yy y$

" vを二回で行末まで選択
vnoremap <silent>vv $h

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap <silent>jj <Esc>

" ESCを二回押すことでハイライトを消す
nmap <silent><ESC><ESC> :nohlsearch<CR><ESC>

" /を二回押すことで選択した文字列を検索
vnoremap <silent> // y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>

" 誤操作すると困るキーを無効化する(ZZ(保存して閉じる)とZQ(保存せず閉じる)、Qでexモードに入れるがモードを変えられなくなる)
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q 	<Nop>
nnoremap gq <Nop>

" ---------- <Leader>に<space>を使用
let g:mapleader = "\<space>"

" '<Leader>w'、でファイル保存
nnoremap <Leader>w :w<CR>

" '<Leader>o'、で新しいファイルを開く
nnoremap <Leader>o :o<CR>

" '<Leader>.v'、で.vimrcを開く
nnoremap <Leader>.v :new ~/.vim/.vimrc<CR>

" '<Leader>.vp'、で.plugins.vimを開く
nnoremap <Leader>.vp :new ~/.vim/.plugins.vim<CR>

" '<Leader>sv'、で:source ~/.vim/.vimrc
nnoremap <Leader>sv :source ~/.vim/.vimrc<CR>

" '<Leader>.z'、でzshrcを開く
nnoremap <Leader>.z :new ~/.zsh/.zshrc<CR>

" '<Leader>.zp'、で.plugins.zshを開く
nnoremap <Leader>.z :new ~/.zsh/.plugins.zsh<CR>

" '<Leader>.za'、でzshrcを開く
nnoremap <Leader>.z :new ~/.zsh/.plugins.zsh<CR>

" '<Leader>sz'、で:source ~/.zsh/.zshrc
nnoremap <Leader>sz :source ~/.zsh/.zshrc<CR>

" '<Leader>c'と'<Leader>v'、でシステムのクリップボードにコピー＆ペーストする
vmap <Leader>y "+y
vmap <Leader>d "+d
map <Leader>p "+p
map <Leader>P "+P

" '<Leader>j', '<Leader>k'、で画面送り
noremap <Leader>j <c-f><cr><cr>
noremap <Leader>k <c-b><cr><cr>

" 押しにくいキー '行の先頭^' '行の末尾$' '*' '%'
noremap <Leader>h ^
noremap <Leader>l $
nnoremap <Leader>/ *
noremap <Leader>m %

" カーソル下の単語を、置換後の文字列の入力を待つ状態にする
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>

" ==========================================================================
" 以上共通設定

" MacOSとLinuxで設定を分ける(多くなりすぎたら更にfileを分ける)
"let OSTYPE = system('uname')

"if OSTYPE == "Darwin\n"
"   .vimrc setting MacOS only
"   source ~/.zsh/.vimrc.darwin

"elseif OSTYPE == "Linux\n"
"   .vimrc setting LinuxOS only
"   source ~/.zsh/.vimrc.linux

"endif

" .vimrc(CUIvim)と.gvimrc(GUIvim)で設定を分ける(多くなりすぎたら更にfileを分ける)
"if has("gui_running")
"   .vimrc setting GUI only
"   source ~/.zsh/.gvimrc

"endif
" ==========================================================================
