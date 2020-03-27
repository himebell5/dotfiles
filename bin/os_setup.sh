#!/bin/bash
#
set -e
DOTPATH="${HOME}/dotfiles"
DOTINIT="${DOTPATH}/bin"

has() {
  type "$1" > /dev/null 2>&1
}
echo "$(tput setaf 2)===============================================$(tput sgr0)"
echo "$(tput setaf 2)----- OS setup & Applications update ⭐︎彡 -----$(tput sgr0)"
echo "$(tput setaf 2)===============================================$(tput sgr0)"
usage() {
  name="basename: $(tput setaf 3)$0$(tput sgr0)"
  cat <<EOF

$(tput setaf 5)* $USER *$(tput sgr0)
   
$(tput setaf 4)Usage:$(tput sgr0)
  $name $(tput setaf 6)[Command]$(tput sgr0) 
  
$(tput setaf 4)Commands:$(tput sgr0)
  $(tput setaf 6)macos $(tput sgr0)		:defaults write... 
  $(tput setaf 6)linuxos $(tput sgr0)		:sudo...
  $(tput setaf 6)update $(tput sgr0)        	:update for homebrew,applications,apt and etc 
  
EOF
  exit 0
}

cd "${DOTINIT}"
source "${DOTINIT}/macos_setup"
source "${DOTINIT}/linuxos_setup"
source "${DOTINIT}/update"


macos_setup() {
	"run_macos_setup" 
}

linuxos_setup() {
	"run_linuxos_setup" 
}

update() {
	"run_update"
}

# 引数によって場合分け
command=$1
[ $# -gt 0 ] && shift
# 引数がなければヘルプ

case $command in
  mac*)
    macos_setup
    ;;
  linu*)
    linuxos_setup
    ;;
  upd*)
    update
    ;;
  *)
    usage
    ;;
esac


exit 0


