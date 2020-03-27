#!/bin/bash
#
# 0. 使用方法(どれかでできるはず)
#   curl -fsSLo "${HOME}/dotfiles.tar.gz" "https://github.com/himebell5/dotfiles/tarball/master"
#   sh {Somewhere}/dep_init.sh download
#   chmod -x {Somewhere}/dep_init.sh && {Somewhere}/dep_init.sh download
# 1. dotfilesのダウンロード
#   sh ${どこか}/dep_init.sh download
#   -->dotfilesが${HOME}にない時にダウンロードしてくる
# 2. dotfileの再配置(deploy)
#   sh ~/dotfiles/dot_init/dep_init.sh deploy
#   -->これだけならシンボリックリンクを作るだけでも使える。上書きはできない。    
# 3. Applicationインストールなど初期状態構築(initialize)
#   sh ~/dotfiles/dot_init/dep_init.sh initialize
#      ├── mac
#      └── linux           
#   -->Homebrewが入ってない時にHomebrew本体、brewbundleによるインストール、その他による初期状態構築
#

set -e
#OS="$(uname -s)"
DOTPATH="${HOME}/dotfiles"
DOT_TARBALL="https://github.com/himebell5/dotfiles/tarball/master"
REMOTE_URL="git@github.com:himebell5/dotfiles.git"
ZDOTDIR="${HOME}/.zsh"
ZDOTPATH="${DOTPATH}/.zsh"
VDOTDIR="${HOME}/.vim"
VDOTPATH="${DOTPATH}/.vim"
BDOTDIR="${HOME}/.bash"
BDOTPATH="${DOTPATH}/.bash"
GDOTDIR="${HOME}/.config/git"
GDOTPATH="${DOTPATH}/.config/git"
DOTINIT="${DOTPATH}/bin"

has() {
  type "$1" > /dev/null 2>&1
}
echo "$(tput setaf 2)=============================================$(tput sgr0)"
echo "$(tput setaf 2)----- Deploy dotfiles & Initialize ⭐︎彡 -----$(tput sgr0)"
echo "$(tput setaf 2)=============================================$(tput sgr0)"
usage() {
  name="basename: $(tput setaf 3)$0$(tput sgr0)"
  cat <<EOF

$(tput setaf 5)* $USER *$(tput sgr0)
   
$(tput setaf 4)Usage:$(tput sgr0)
  $name $(tput setaf 6)[Command]$(tput sgr0) 
  
$(tput setaf 4)Commands:$(tput sgr0)
  $(tput setaf 6)download $(tput sgr0)      :download dotfiles in $(tput setaf 3)${HOME}$(tput sgr0)
  $(tput setaf 6)deploy $(tput sgr0)        :symlink dotfiles to $(tput setaf 3)${HOME}$(tput sgr0)
  $(tput setaf 6)initialize $(tput sgr0)    :settings for homebrew,applications,apt and etc 
 
  * Please login to the $(tput setaf 3)AppStore$(tput sgr0) as preparation (For macOS initialize).
  * Please put the formatted $(tput setaf 3)Brewfile$(tput sgr0) in $(tput setaf 3)${HOME}$(tput sgr0) as preparation (For initialize).
  
EOF
  exit 0
}

# 1. dotfilesのダウンロード(と解凍)
down_dot() {
# dotfilesが${HOME}になければダウンロード。
if [ ! -d "${DOTPATH}" ]; then
  echo "$(tput setaf 2)----- Downloading dotfiles... -----$(tput sgr0)"
  mkdir -p "${DOTPATH}"

# git が使えるなら git、使えない場合は curlを使用する
  if has "git"; then
    git clone --recursive "${REMOTE_URL}" "${DOTPATH}"
  else
    curl -fsSLo "${HOME}/dotfiles.tar.gz" "${DOT_TARBALL}"
    tar -zxfv "${HOME}/dotfiles.tar.gz" --strip-components 1 -C "${DOTPATH}"
    rm -f "${HOME}/dotfiles.tar.gz"   
  fi
 echo "$(tput setaf 2)----- Download dotfiles complete! ✔︎  ⭐︎彡 -----$(tput sgr0)"
else
 echo "$(tput setaf 2)----- Dotfiles already exists ✔︎  ⭐︎彡 -----$(tput sgr0)"
fi
}

# 2. dotfileの再配置
# ln -snfv (symbolic(シンボリックリンク)/no-dereference & force(上書き)/verbose(登録する登録名とリンク先を表示))
# 正規表現で「.??*｣は先頭がドットで始まり、2文字以上のファイルを探索
if [ ! -d "${DOTPATH}" ]; then 
  echo "$(tput setaf 1)----- Please download dotfiles first... -----$(tput sgr0)"
else

cd "${DOTPATH}"
link_files() {
  for f in .??*
  do
    if [ ! -e "${HOME}/${f}" ]; then
	  # 無視したいファイルやディレクトリはこんな風に追加
	  [[ ${f} = ".git" ]] && continue
	  [[ ${f} = ".DS_Store" ]] && continue
      [[ ${f} = ".gitignore" ]] && continue
      ln -snfv "${DOTPATH}/${f}" "${HOME}/${f}"
    fi
  done

# symlink zsh configuration files into ~/.zsh
 cd "${ZDOTPATH}"
    if [ ! -d "$HOME/.zsh" ] ; then
        mkdir -p "$HOME/.zsh"     
    fi
  for f in .??*
  do
    if [ ! -e "${ZDOTDIR}/${f}" ]; then
	    [[ ${f} = ".git" ]] && continue
        [[ ${f} = ".DS_Store" ]] && continue
        [[ ${f} = ".gitignore" ]] && continue
        ln -snfv "${ZDOTPATH}/${f}" "${ZDOTDIR}/${f}"
    fi
  done
    [ ! -e "${ZDOTDIR}/dircolors" ] && ln -snfv "${DOTPATH}/lib/dircolors/dircolors.256dark" "$ZDOTDIR/dircolors" 
    
# symlink vim configuration files into ~/.vim 
 cd "${VDOTPATH}"
    if [ ! -d "$HOME/.vim" ] ; then
        mkdir -p "$HOME/.vim"
        mkdir -p "$HOME/.vim/backup"
        mkdir -p "$HOME/.vim/undo"      
    fi
  for f in .??*
  do
    if [ ! -e "${VDOTDIR}/${f}" ]; then
	    [[ ${f} = ".git" ]] && continue
        [[ ${f} = ".DS_Store" ]] && continue
        [[ ${f} = ".gitignore" ]] && continue
        ln -snfv "${VDOTPATH}/${f}" "${VDOTDIR}/${f}"
    fi
  done

# symlink bash configuration files into ~/.bash 
cd "${BDOTPATH}"
    if [ ! -d "$HOME/.bash" ] ; then
        mkdir -p "$HOME/.bash"
    fi
  for f in .??*
  do
    if [ ! -e "${BDOTDIR}/${f}" ]; then
	    [[ ${f} = ".git" ]] && continue
        [[ ${f} = ".DS_Store" ]] && continue
        [[ ${f} = ".gitignore" ]] && continue
        ln -snfv "${BDOTPATH}/${f}" "${BDOTDIR}/${f}"
    fi
  done

# symlink git configuration files into ~/.config/git 
cd "${GDOTPATH}"
    if [ ! -d "$HOME/.config/git" ] ; then
        mkdir -p "$HOME/.config/git"
    fi
  for f in ??*
  do
    if [ ! -e "${GDOTDIR}/${f}" ]; then
	    [[ ${f} = ".git" ]] && continue
        [[ ${f} = ".DS_Store" ]] && continue
        [[ ${f} = ".gitignore" ]] && continue
        ln -snfv "${GDOTPATH}/${f}" "${GDOTDIR}/${f}"
    fi
  done


  echo "$(tput setaf 2)----- Deploy dotfiles complete! ✔︎  ⭐︎彡 -----$(tput sgr0)"
}
fi

# 3. 初期状態構築(必要コマンドやアプリのインストール)
if [ ! -d "${DOTPATH}" ]; then 
  echo "$(tput setaf 1)----- Please download dotfiles first... -----$(tput sgr0)"
else

cd "${DOTINIT}"
source "${DOTINIT}/mac_init"
source "${DOTINIT}/linux_init"

initialize() {
  case ${OSTYPE} in
    darwin*)
        "run_mac" ;;
    linux-gnu*)
        "run_linux" ;;    	    
    *)
        echo "$(tput setaf 1)----- Working only OSX / Linux(Ubuntu)... -----$(tput sgr0)" && exit 1 ;;
  esac
  echo "$(tput setaf 2)----- Initialize complete! ✔︎  ⭐︎彡 -----$(tput sgr0)"
}
fi

# 引数によって場合分け
command=$1
[ $# -gt 0 ] && shift

# 引数がなければヘルプ
case $command in
  down*)
    down_dot
    ;;
  dep*)
    link_files
    ;;
  init*)
    initialize
    ;;
  *)
    usage
    ;;
esac

exit 0

