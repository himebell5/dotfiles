# ===========================================================
# .zshrc General Config
# ===========================================================

# ================ Basic settings ================

# brew で fzf fd ripgrep bat exa coreutil  導入済みでの設定
#   fzf         曖昧検索(fd・rgで高速に、bat・exaでカラフルに)
#   fd          findの代替(fileやdirを検索する)
#   ripgrep(rg) grepの代替(特定の文字を含むfileの行を検索する)
#   bat         catの代替(fileの中身を表示)
#   exa         lsの代替(fileやdirを表示)
#	coreutil	gnuコマンドを使えるようにする(lsだけではなく)

# =============== Load plugins ================
# コマンド補完機能を有効にする。pluginsより前でないとダメらしい。
autoload -Uz compinit && compinit

# 設定ファイル.plugins.zshを読み込む
# zinitをplugin managerとして 導入済みでの設定
#    -->.plugin.zsh
source ~/.zsh/.plugins.zsh

# =============== Load alias-bindkey-functions ================
# 設定ファイル.alias.zshを読み込む
source ~/.zsh/.alias.zsh

# ================ Options settings ================
# setopt オプション名
# zstyle ':completion:*:*:コマンド:*:タグ'     スタイル

# ================ Completions ================
# 補完候補に色つける
autoload -U colors && colors

# Enable completions
# rm -f ~/.zcompdump; compinitでリビルド
#.zshの中に移動
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
export zcompdump="${ZDOTDIR}/.zcompdump"

# 補完候補を一覧を表示
setopt auto_list
# ディレクトリ名の補完で末尾の/を自動的に付加し、次の補完に備える
setopt auto_param_slash
# ファイル名の展開でディレクトリにマッチした場合 末尾に/を付加
setopt mark_dirs
# 補完候補一覧でファイルの種別を識別マーク表示訳注:ls -F の記号
setopt list_types
# 補完キー連打で順に補完候補を自動で補完
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる  
setopt magic_equal_subst
# 語の途中でもカーソル位置で補完
setopt complete_in_word
# カーソル位置は保持したままファイル名一覧を順次その場で表示
setopt always_last_prompt
# ディレクトリのスラッシュを削除しない
setopt noautoremoveslash
# 日本語ファイル名等8ビットを通す
setopt print_eight_bit
# 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt extended_glob
# 明確なドットの指定なしで.から始まるファイルをマッチ
setopt globdots
# 補完リストを詰めて表示
setopt list_packed
# コマンドの打ち間違いを指摘してくれる。
setopt correct
# コマンドがスペースで始まる場合、コマンド履歴に追加しない履歴に残したくないコマンドを入力するとき使う
# 例： <Space>echo hello と入力
#setopt hist_ignore_space
# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
# 補完候補を ←↓↑→ でも選択出来るようにする
zstyle ':completion:*:default' menu select=2
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 詳細な情報を使う。
zstyle ':completion:*' verbose yes
# 補完方法の設定。指定した順番に実行する。
zstyle ':completion:*' completer _oldlist _expand _complete _match _history _ignored _approximate _list _prefix
# 補完候補に色を付ける。"": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors ""
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'Completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# グループ名に空文字列を指定すると，マッチ対象のタグ名がグループ名に使われる。すべての マッチ種別を別々に表示させたいなら以下のようにする
zstyle ':completion:*' group-name ''
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin/usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command \'ps x -o pid,s,args\'
# 展開する前に補完候補を出させる(Ctrl-iで補完するようにする) 
#bindkey "^I" menu-complete

# ================ History ================
# 履歴ファイルの保存先
export HISTFILE="${ZDOTDIR}/.zsh_history"
# export HISTFILE=${HOME}/.zsh_history
# メモリ上に保存される件数（検索できる件数）
export HISTSIZE=10000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 直前のコマンドの重複を削除
setopt hist_ignore_dups
# 重複するコマンドが記憶されるとき、古い方を削除する。
setopt hist_ignore_all_dups
# 重複するコマンドが保存されるとき、古い方を削除する。
setopt hist_save_no_dups
# 余分なスペースを削除してヒストリに記録する
setopt hist_reduce_blanks
# 履歴ファイルに時刻を記録
setopt extended_history
# 同時に起動した複数端末間で共有する
setopt share_history

# =============== autocd & cdr & named directory ================
# ---------- autocd
# directoryに別名が付けられ、directory名の入力だけで移動できる機能
# directory名を入力するだけでcdできるようにする(cdコマンド省略)
setopt auto_cd
# cd -[tab]で自動的にpushdする(過去のディレクトリに飛べる)
setopt auto_pushd
# pushdから重複を削除(重複したディレクトリを追加しない)
setopt pushd_ignore_dups

# どこからでも参照できるディレクトリパス(カレントディレクトリ中にサブディレクトリが無い場合に cd が検索するディレクトリのリスト)
cdpath=('$HOME')

# ---------- cdr機能
# cdrコマンドを有効 ログアウトしても有効なディレクトリ履歴
# cdrコマンドで履歴にないディレクトリにも移動可能に
# cdr タブでリストを表示
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500 # cdrの履歴を保存する個数
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# ---------- 複数ファイルリネーム
#ex) zmv **.txt file-**.txt  (テキスト**を`file-**`にリネームする)
#zmv -n : option実行せずに変更内容を確認する
autoload -Uz zmv
alias zmv='noglob zmv -W'

# =============== Other option settings ================
# ビープ音を鳴らさない
setopt nolistbeep
# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# 区切り文字の設定
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# Ctrl+sのロック, Ctrl+qのロック解除を無効にする
setopt no_flow_control

# どの環境でもクリップボードにコピー(macではpbcopy linuxではxselが必要)
# 使い方
# % vim mail.txt    # vim でメールを書く
# % cat mail.txt C  # メールの内容をクリップボードにコピーする
# INPUT.txt のうち 10から15行目をクリップボードにコピーする
# % sed -n '10,15p' INPUT.txt C
if which pbcopy >/dev/null 2>&1 ; then
	# Mac
	alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
	# Linux
	alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
	# Cygwin
	alias -g C='| putclip'
fi

# ---------- SPROMPT correct suggest
# コマンドの打ち間違いを指摘してくれる。ちょっとうざい。
SPROMPT='`suggest`'
suggest () {
  local color yes no abort edit message
  color="${fg[yellow]}"
  yes="${fg[green]}そうよ!(y)${reset_color}"
  no="${fg[red]}ちがう!(n)${reset_color}"
  abort="${fg[blue]}やめる!(a)${reset_color}"
  edit="${fg[cyan]}直すね!(e)${reset_color}"
  message="${color}(*'~')?${reset_color} < もしや ${color}%B%r%b${reset_color} なの? [${yes},${no},${abort},${edit}]: "
  echo "${suggest}${message}"
}

# =============== fd & ripgrep & bat settings ================
# 元のコマンドを使用したければ
# command find(grep/cat) でできるはず
# 不都合があればコメントアウトして

# ---------- コマンドの置き換え(コマンドがあれば)
if which 'fd' >/dev/null 2>&1 ; then
alias find='fd'
alias fd='fd -iH --no-ignore-vcs -E ".git|node_modules"'
fi
if which 'rg' >/dev/null 2>&1 ; then
alias grep='rg'
alias rg='rg --hidden -g '!.git' -g '!.node_modules' --max-columns 200'
fi
if which 'bat' >/dev/null 2>&1 ; then
alias cat='bat -A'
fi

# ---------- batのColortheme (使えるthemeは、bat --list-themesで確認)
export BAT_THEME="Monokai Extended Bright"

# =============== ls(exa) settings & dircolor ================
# ---------- exaを使う(exaがあれば)
# --git(git情報付与) --git-ignore(.gitignoreに記載されているものを無視)
# -T(ツリー表示) --icons(icon表示) -a(隠しファイルも表示) -h(ヘッダー表示)
# -l(ロング表示) -b(サイズ) -g(グループ) -F(隠しファイルを含むすべてのファイルを表示する。ディレクトリには/、実行ファイルには*、シンボリックリンクはオリジナルを表示(または＠))、--helpで細かいことは確認
# めんどくさいのでlsもlaにする
# chpwd(){}  --- cdの後にlsを実行(ディレクトリ移動したら一覧表示) 

if which 'exa' >/dev/null 2>&1 ; then
alias ls='exa -aF --group-directories-first --icons'
alias la='exa -aF --group-directories-first --icons'
alias ll='exa -ahlbgF --git --time-style=iso --group-directories-first --icons'
alias tr2='exa -ahlF --git-ignore --group-directories-first --time-style=long-iso -T -L=2 --ignore-glob=".git|node_modules" --icons'
alias tr3='exa -alhF --git-ignore --group-directories-first --time-style=long-iso -T -L=3 --ignore-glob=".git|node_modules" --icons'
chpwd() {exa -aF --group-directories-first --icons}

else
 case ${OSTYPE} in
  darwin*)	# MacOS only
	alias ls='gls --color=auto --human-readable --group-directories-first'
	alias la='gls -aF --color=auto --human-readable --group-directories-first'
	alias ll='gls -alF --color=auto --human-readable --group-directories-first'
	;;
  linux*)	# LinuxOS only
	alias ls='ls --color=auto --human-readable --group-directories-first'
	alias la='ls -aF --color=auto --human-readable --group-directories-first'
	alias ll='ls -alF --color=auto --human-readable --group-directories-first'
	;;
 esac
chpwd() {ls -aF --color=auto --human-readable --group-directories-first}
fi

# ---------- dircolorsによる色付け
# brew coreutilsが必要。exaでも色が変わるけどフォルダが青い方が好みだったのであえて設定。
# 気分を変えたいときは"~/.zsh/dircolors"へのリンクを張り替え。
# 今の所あるのは、dircolors.256dark/dircolors.ansi-dark/dircolors.jellybeans/dircolors.monokai/dircolors.zenburn
# ln -snfv "~/dotfiles/dircolors/dircolors.256dark" "~/.zsh/dircolors" 

export TERM=xterm-256color
[[ -f $ZDOTDIR/dircolors && -x 'which dircolors' ]]
case ${OSTYPE} in
  darwin*)	# MacOS only
	eval $(gdircolors ~/.zsh/dircolors)
	;;
  linux*)	# LinuxOS only
	eval $(dircolors ~/.zsh/dircolors)
	;;
esac

# ---------- 補完機能もLS_COLORSに合わせて色が付くように
if [ -n '$LS_COLORS' ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# =============== fzf settings ================
#       "^T"	カレントディレクトリのfile検索
#       "^R"	過去のコマンド検索
#       "^S"	カレントディレクトリのcd補助(ALT-c置き換え)
# ~/.zsh/.zshrcから~/.fzf.zshを読み込む設定
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ${ZDOTDIR}/.fzf.zsh ] && source ${ZDOTDIR}/.fzf.zsh

# ---------- fzf
# macだとどうしてもMETAの設定をしないとALT_Cの設定が自動でできない。しかし'ALT-C' は押しにくいので'ALT-A'に。
#bindkey 'ç'			fzf-cd-widget		#METAにせず、ALT-Cが使いたいなら
zle -N fzf-cd-widget
bindkey '^[a'		fzf-cd-widget		#(ALT=META時)

# ---------- fzfでfdを使う
#fzfの検索(find)はfdにする。色付き出力を使用したい(パフォーマンスは遅くなる恐れ)、検索から.gitファイルは除外する
export FZF_DEFAULT_COMMAND="fd --type file --color=always --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ---------- fzfでripgrepを使う
#fzfの検索(grep)はripgrepを使い、隠しファイルを除外しないようにする
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ---------- fzfの外観
#colorに Solarized Dark、previewにbat、exaでtreeの代用も効いた(色付き)。
export FZF_DEFAULT_OPTS="
--height 70% --reverse --border --inline-info --multi
--color dark,fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
"
export FZF_CTRL_T_OPTS="--select-1 --exit-0
--preview '(highlight -O ansi -l {} 2> /dev/null || bat --color=always {} || exa -T --group-directories-first --icons {}) 2> /dev/null | head -200'
"
export FZF_CTRL_R_OPTS="--select-1 --exit-0
"
export FZF_ALT_C_OPTS="--select-1 --exit-0
--preview '(highlight -O ansi -l {} 2> /dev/null || bat {} || exa -T --color=always --group-directories-first --icons {}) 2> /dev/null | head -200'
"

# ===========================================================
# 以上共通設定

# MacOSとLinuxで設定を分ける(多くなりすぎたら更にfileを分ける)
case ${OSTYPE} in
    darwin*)
#.zshrc setting MacOS only
#        source ~/.zsh/.zshrc.darwin

        ;;
    linux*)
#.zshrc setting LinuxOS only
#        source ~/.zsh/.zshrc.linux

        ;;
esac

# ===========================================================
