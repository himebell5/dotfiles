#-----------------------
# Pureっぽいプロンプト
#-----------------------
# pull⇣/push⇡ の表示は何か数式を入れないとダメみたい。git-stashはよくわからない。普通にpureを入れたほうがいいと思うw
# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst
# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'

# プロンプト表示直前にvcs_info関数を呼び出す。vcs情報はformatsで整形され vcs_info_msg_0_ に挿入される
precmd() { vcs_info }

# vcs_info_msg_0_の書式設定
# gitのチェックを有効にする
zstyle ":vcs_info:*" enable git
# commitしていない変更をチェックする
zstyle ':vcs_info:git:*' check-for-changes true
# commitしていないstageがあることを示す文字列 ＊
zstyle ':vcs_info:git:*' stagedstr         "%F{yellow}＊%f"
# addしていない変更があることを示す文字列 ＋
zstyle ':vcs_info:git:*' unstagedstr       "%F{red}＋%f"
# gitリポジトリに対して、変更情報とリポジトリ情報を表示する [master]
zstyle ':vcs_info:*'     formats           " [%F{green}%b%f%c%u]"
# gitリポジトリに対して、コンフリクトなどの情報をformatsの代わりに表示する
zstyle ':vcs_info:*'     actionformats     " [%F{red}(%s)-[%b|%a]%f]"

# プロンプト
local prompt_location="%F{cyan}%B%~%b%f"
local promot_mark="%B%(?,%F{magenta},%F{red})%(!,#,❯❯❯)%b"
PROMPT="
${prompt_location}"'$vcs_info_msg_0_'"
${promot_mark} "

