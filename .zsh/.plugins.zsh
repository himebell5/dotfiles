# ==========================================================
# zinit settings
# ==========================================================
# ---------- 環境変数 ZINIT_HOME
# ZINITを'$ZDOTDIR=~/.zsh'の中に
export ZINIT_HOME="${ZDOTDIR:-$HOME}/.zinit"
source "$ZINIT_HOME/bin/zinit.zsh"

# ZINITのコマンド補完をautoload
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
#fpath=($ZINIT_HOME/completions(N-/) $fpath)

# zinitで管理するプラグイン
# zinit self-update
# zinit update
# zinit delete プラグイン名
# ice waitを使うことでプラグインを遅延読み込みできる wait'!0'

zinit ice depth=1
zinit light 'romkatv/powerlevel10k' 		#zsh-prompt
zinit ice wait'!0' lucid as"completion"
zinit light 'zsh-users/zsh-completions'         #コマンド+tab補完
zinit ice wait'!0' lucid
zinit light 'zdharma/fast-syntax-highlighting' #構文のハイライト
zinit ice wait'0' lucid
zinit light 'zsh-users/zsh-history-substring-search' #historyから灰色で補完
zinit ice wait'!0' lucid
zinit light 'zsh-users/zsh-autosuggestions'   #コマンドのサジェスト色付け
zinit ice wait'0' lucid
zinit light 'b4b4r07/enhancd'	 		#fzfと合わせてcdが便利に(cd [-|..])
zinit ice wait'0' lucid
zinit light 'mollifier/anyframe'        #fzfの補助function10個。追加可。
zinit ice wait'0' lucid
zinit light 'b4b4r07/zsh-gomi'         #ゴミ箱から復元rm(fzf依存でより便利)

#zinit light 'rupa/z'				#cd を便利にする。人気があるけどenhancdでいいやとおもって。気が向いたら入れる
#zinit light 'changyuheng/fz'		#途中途中の補完。zに依存
#zinit light 'Aloxaf/fzf-tab'		#コマンド+tab補完(fzf依存で過剰に)おもしろいけどいらないかなって。
#zinit light 'zsh-users/zsh-syntax-highlighting' #構文のハイライト。
#zinit light 'zdharma/history-search-multi-word'	#historyから灰色で補完
#zinit ice pick"async.zsh" src"pure.zsh"; zinit light 'sindresorhus/pure'

# ==========================================================
# zinit plugin settings
# ==========================================================
# -------------------------------------------------
# powerlevel10k settings
# -------------------------------------------------
# - Must be the end of .zshrc.
# - `p10k configure` to restart setting.
#source $ZDOTDIR/.zinit/plugins/romkatv---powerlevel10k/powerlevel10k.zsh-theme
# インスタントプロンプト(初期化したときの表示)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# カスタマイズしたかったらここ!(~/.p10k.zshから~/.zsh/.p10k.zshに置き換えた)
[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh
# zshrcに書いても大丈夫そう
POWERLEVEL9K_DIR_HOME_FOREGROUND='cyan'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='cyan'
POWERLEVEL9K_TIME_FOREGROUND='blue'

# Pureっぽい自作プロンプト
#[[ ! -f ~/.zsh/.pure*.zsh ]] || source ~/.zsh/.pure*.zsh

#-------------------------------------------------
# fast-syntax-highlighting
#-------------------------------------------------
# fast-theme -l                 themeリスト表示
# fast-theme -t {theme-name}    themeが選べる

#-------------------------------------------------
# syntax-highlighting settings
#-------------------------------------------------
#初期はmainのみ。main(コマンド、文字列、パスなど)、 brackets(括弧)、 cursor(カーソル)、root(ユーザがrootの場合にコマンドライン全体に適用)、line(コマンドライン全体に適用)が適用できる。
#ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# -------------------------------------------------
# enhancd settings (fzf連携)
# -------------------------------------------------
# cd	一度アクセスしたディレクトリのリストを表示
# cd -	ログ内の最後の10個のディレクトリ項目から検索
# cd .. 上位階層への移動

# ---------- 環境変数 ENHANCD_DIR
# ~/.enhancdを'$ZDOTDIR=~/.zsh'の中に
export ENHANCD_DIR="$ZDOTDIR/.enhancd"

# -------------------------------------------------
# zsh-gomi settings (fzf連携)
# -------------------------------------------------
# CLI用のゴミ箱を作る
# alias rm='gomi'にするとまとめてunlinkにrmが使えなくなるのがちょっと問題。
# なのでgomiで運用
# rm(gomi) file              #ゴミ箱に捨てる
# rm(gomi) --restore         #ゴミ箱をあさる
# rm(gomi) --system file     #システムのゴミ箱に移動

# ---------- 環境変数 GOMI_DIR
# ~/.gomiを'$ZDOTDIR=~/.zsh'の中に
export GOMI_DIR="$ZDOTDIR/.gomi"
#alias rm='gomi'

# -------------------------------------------------
# anyframe settings (fzf連携)
# -------------------------------------------------
# expressly specify to use fzf pecoやfzfを複数入れてる時選ぶ。一つなら不要。
#zstyle ":anyframe:selector:" use fzf

# anyframe-customのパスを通す
fpath=(~/.zsh/anyframe-custom(N-/) $fpath)

# macの特殊なbindkey設定。
# Terminalの環境設定から、ALT=META にするか
# bindkey '特殊文字' で登録。'å'とか'ß'

# anyframe-widgetから選んでそれを実行する"ALT-S"
    zle -N      anyframe-widget-select-widget
    bindkey '^[s'	anyframe-widget-select-widget	#ALT-S(ALT=META時)
# cdr --- 過去に移動したことのあるディレクトリ一覧 ⇒ 選択 ⇒ 移動(cdrが必要)"Ctrl-S"
    zle -N      anyframe-widget-cdr
    bindkey '^S' 	anyframe-widget-cdr
# checkout-git-branch --- Gitブランチを切り替える
    zle -N      anyframe-widget-checkout-git-branch
    bindkey '^x^b' anyframe-widget-checkout-git-branch
# insert-git-branch --- Gitブランチ一覧 ⇒ 選択 ⇒ その名をコマンドラインに挿入
    zle -N      anyframe-widget-insert-git-branch
    bindkey '^x^i' anyframe-widget-insert-git-branch
# insert-filenameファイル名一覧 ⇒ 選択 ⇒ コマンドラインに挿入
    zle -N      anyframe-widget-insert-filename
    bindkey '^x^f' anyframe-widget-insert-filename
# kill --- プロセスをkillする
    zle -N      anyframe-widget-kill
    bindkey '^x^k' anyframe-widget-kill
# put-history --- コマンド履歴一覧 ⇒ 選択 ⇒ コマンドラインに挿入
    zle -N      anyframe-widget-put-history
    bindkey '^x^p' anyframe-widget-put-history

# execute-history --- コマンド履歴一覧 ⇒ 選択 ⇒ 実行 *(^Rとの違いが？)
    zle -N      anyframe-widget-execute-history
#    bindkey '^x^r' anyframe-widget-execute-history
# cd-ghq-repository --- ghqコマンドで管理しているリポジトリに移動する(ghqが必要)
    zle -N      anyframe-widget-cd-ghq-repository
#    bindkey '^x^g' anyframe-widget-cd-ghq-repository
# tmux-attach --- tmuxセッションを選んでアタッチする(tmuxが必要)
    zle -N      anyframe-widget-tmux-attach
#    bindkey '^x^t' anyframe-widget-tmux-attach

# ---------- 自分で関数を追加する
# パターン
# function(){}は書かずに、{}の中身だけ書くことに注意する。
#    1. 選択した結果をzshですぐに実行する
#    2. 選択した結果で現在のコマンドラインを置き換える
#    3. 選択した結果をコマンドラインのカーソル位置に挿入する
# aliasまたはbindkeyの設定が必要

#       <(a)選択する候補を標準出力に出力する処理> \
#           | anyframe-selector-auto \
#           | <(b)選択結果に対するフィルタ(必要なときだけ)> \
# 1.のとき  | anyframe-action-execute
# 2.のとき  | anyframe-action-put
# 3.のとき  | anyframe-action-insert

# ---------- 追加したwidget
# ~/.zsh/anyframe-custom/anyframe-functions/widgets につっこむ。
# するとanyframe-widget-select-widgetにも入ってくる。
# 自分で作ることができればとても便利。
