# ===========================================================
# ――*―― .zprofile ――*――
# ===========================================================
# MacOSとLinuxで設定を分ける(多くなりすぎたら更にfileを分ける)
case ${OSTYPE} in
    darwin*)
#.zprofile setting MacOS only
#       source ~/.zsh/.zprofile.darwin

# ---------- Homebrew for mac
export PATH="/usr/local/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1  #Analyticsによる情報収集を停止する

# ---------- 接頭辞gをつけずにcoreutilsを使うためのpath。
# 具体的にはMacOSでdircolorsを使うためにgnubin、ついでにgnuman。
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

        ;;

# ===========================================================
    linux*)
#.zprofile setting LinuxOS only
#       source ~/.zsh.zprofile.linux

# ---------- Homebrew for Linux
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
export HOMEBREW_NO_ANALYTICS=1  #Analyticsによる情報収集を停止する

# エラーが出る場合はこっちを追加
#PATH="$(brew --prefix)/bin:$PATH"
#export MANPATH="$(brew --prefix)/share/man:$MANPATH"
#export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

        ;;
esac

# ===========================================================
# 以下共通設定

# -------------------------------------------------
# narou.rb
# -------------------------------------------------
# zshenvではなくzprofileでないとダメなようだ
# ---------- rbenv からインストールしたrubyを使う
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

 # ---------- homebrew でインストールしたjavaを使う
if [[ -x /usr/libexec/java_home ]] && /usr/libexec/java_home 2>&1 >/dev/null; then
  export JAVA_HOME="$(/usr/libexec/java_home -v 13)"
  PATH="${JAVA_HOME}/bin:${PATH}"
fi

