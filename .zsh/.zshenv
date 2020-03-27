# ===========================================================
# ――*―― .zshenv ――*――
# ===========================================================
# MacOSとLinuxで設定を分ける(多くなりすぎたら更にfileを分ける)
case ${OSTYPE} in
    darwin*)
#.zshenv setting MacOS only
#        source ~/.zsh/.zshenv.darwin

# $ZDOTDIR/.zshenv が適応されない場合の設定だったのだが、unsetoptが効かなくなってるみたい。なのでpathが通らなかったら素直に.zprofileに置く。
# macのpath_helperによって、/etc/zprofileが.zshenvより後に読み込まれてpathがスルーされるためなのでロードせず、中身だけ先にコピーしておく。
# ---------- /etc/以下にある設定ファイルをロードしない
# avoid loading /etc/profile (not to execute /usr/libexec/path_helper)
#        unsetopt global_rcs
# ---------- from /etc/zprofile
# system-wide environment settings for zsh(1)
#if [ -x /usr/libexec/path_helper ]; then
#        eval `/usr/libexec/path_helper -s`
#fi
        ;;
    linux*)
#.zshenv setting LinuxOS only
#        source ~/.zsh/.zshenv.linux

        ;;
esac

# ===========================================================
# 以下共通設定

# -------------------------------------------------
#  Environment variables
# -------------------------------------------------
# ---------- 環境変数日本語を使用
export LC_ALL=ja_JP.UTF-8
export LANG=ja_JP.UTF-8

# ---------- 環境変数 VIMINIT
# vimrcを~/.vimに。ちなみにviminfoはvimrcの中でsetで指定。
export VDOTDIR="$HOME/.vim"
export VIMINIT="source ~/.vim/.vimrc"

# ---------- diff-highlightを使う
export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"




