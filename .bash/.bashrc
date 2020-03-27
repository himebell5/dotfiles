# ===========================================================
# ――*―― .bashrc ――*――
# ===========================================================
# わりとありのままのbash

# ---------- Prompt
# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# default:cyan / root:red
if [ $UID -eq 0 ]; then
	PS1="\[\033[31m\]\u@\h\[\033[00m\]:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $"
else
	PS1="\[\033[36m\]\u@\h\[\033[00m\]:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $"

# ---------- Completions
# bash-completion パッケージをインストールした方がいいのかもしれない(デフォじゃキツければ)。その場合"complete"と衝突するかも
# completion for man command
complete -c man which
# completion for sudo command
complete -cf sudo
# completion for git
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# ---------- Histories
# 履歴ファイルの保存先
export HISTFILE="${BDOTDIR}/.bash_history"
# メモリ上に保存される件数（検索できる件数）
export HISTSIZE=10000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000
# 表示されるHistoryに時間表示
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
# 同じコマンドが重複して記録されないようにする
export HISTCONTROL=ignoredups

# ---------- Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias v='vim'								#vimを起動
alias vi='vim'
alias h='fc -lt '%F %T' 1'              #historyに日付を表示
alias cp='cp -i'						#コピー上書きする前に確認する
alias rm='rm -i'						#削除する前に確認する
alias mv='mv -i'                        #移動する前に確認する
alias which='type -p'
alias sudo='sudo '
alias gst='git status'

case ${OSTYPE} in
    darwin*)
#.zshrc setting MacOS only
alias ls='ls -FG --group-directories-first'
alias la='ls -aFG --group-directories-first'
alias ll='ls -laFG --group-directories-first'

        ;;
    linux*)
#.zshrc setting LinuxOS only
alias ls='ls -F --color=auto --group-directories-first'
alias la='ls -aF --color=auto --group-directories-first'
alias ll='ls -laF --color=auto --group-directories-first'
alias grep='grep --color=auto'

        ;;
esac

# ---------- Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

NC='\033[m'               # Color Reset
CR='$(echo -ne '\r')'
LF='$(echo -ne '\n')'
TAB='$(echo -ne '\t')'
ESC='$(echo -ne '\033')'

# ---------- shopt (shopt -s 有効化/shopt -u 無効化)
# 設定はあるのだけどよくわからないので重要なのだけはon。他も自動でonやらoffやらになってるはず。$shoptで確認できる。
bashrc_shopt() {
	shopt -s autocd      	#on
	#shopt -s cdable_vars     #on
	shopt -s cdspell         #on
	#shopt -s shopt -s checkhash       #on
	#shopt -s checkjobs       #on
	shopt -s checkwinsize    #on
	#shopt -s cmdhist         #on
	#shopt -s compat31        #on
	#shopt -s compat32        #on
	#shopt -s compat40        #on
	#shopt -s compat41        #on
	#shopt -s shopt -s direxpand       #on
	shopt -s dirspell        #on
	#shopt -s dotglob         #on
	#shopt -s execfail        #on
	#shopt -s expand_aliases  #on
	#shopt -s extdebug        #on
	shopt -s extglob         #on
	#shopt -s shopt -s extquote        #on
	#shopt -s failglob        #on
	#shopt -s force_fignore   #on
	shopt -s globstar        #on
	#shopt -s gnu_errfmt      #on
	shopt -s histappend      #on
	#shopt -s histreedit      #on
	#shopt -s histverify      #on
	#shopt -s hostcomplete    #on
	#shopt -s huponexit       #on
	#shopt -s shopt -s interactive_comments    #on
	#shopt -s lastpipe        #on
	#shopt -s lithist         #on
	#shopt -s login_shell     #on
	#shopt -s mailwarn        #on
	#shopt -s no_empty_cmd_completion #on
	#shopt -s nocaseglob      #on
	#shopt -s nocasematch     #on
	#shopt -s nullglob        #on
	#shopt -s progcomp        #on
	#shopt -s promptvars      #on
	#shopt -s restricted_shell        #on
	#shopt -s shift_verbose   #on
	#shopt -s sourcepath      #on
	#shopt -s xpg_echo        #on
}

# ---------- Other settings
# Tree表示っぽいもの
alias tre="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"

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
