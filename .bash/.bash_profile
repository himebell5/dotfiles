# ===========================================================
# ――*―― .bash_profile ――*――
# ===========================================================

# ---------- 環境変数日本語を使用
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# ---------- 環境変数 BDOTDIR
# $HOMEがdotfileで埋まることが嫌なので ~/.bash/.bashrc
export BDOTDIR="$HOME/.bash"

# bashrcを読み込む設定
if [ -f $BDOTDIR/.bashrc ] ; then
	 source "$BDOTDIR/.bashrc"
fi

# Linuxなどで、元から.profileというファイルがあった場合
#if [ -f $BDOTDIR/.profile ] ; then
#	source "$BDOTDIR/.profile"
#fi
#if [ -f /etc/profile ]; then
#	PATH=source /etc/profile
#fi
#if [ -f /etc/bashrc ]; then
#	source "/etc/bashrc"
#fi

# ---------- 環境変数 VIMINIT
# vimrcを~/.vimに。ちなみにviminfoはvimrcの中でsetで指定。
export VIMINIT="source ~/.vim/.vimrc"

