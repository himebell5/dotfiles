# =============== Aliases & Bindkeys & Functions settings ================

# =============== Aliases ================
# エイリアス/コマンドの短縮登録
# alias コマンドで確認できる

# ---------- gloval alias
# gloval option(-g)をつけて設定したaliasは、commandの先頭だけでなくcommandの任意の場所で展開できる
alias -g L='| less -R'					#テキスト・ファイルの内容を閲覧する
alias -g H='| head'				  #ファイルの先頭から表示する
alias -g G='| grep --color=auto'		#特定の文字列検索
alias -g GI='| grep -ri --color=auto' 	#大文字と小文字を区別せずディレクトリ内も検索
alias -g N='| /dev/null'	#出力が破棄され、なにも表示されない
alias -g S='| sort'		#テキストファイルをソート(昇順)
alias -g T='| tail'					#ファイルの最後から表示する
alias -g W='| wc'		#ファイルのバイト数・単語数・行数を表示
alias -g X='| xargs'	#標準入力やファイルからリストを読み込み、コマンドラインを作成して実行
alias -g ..='cd ..'
alias -g ..2='cd ../..'
alias -g ..3='cd ../../..'
alias -g ..4='cd ../../../..'
alias -g ..5='cd ../../../../..'

# ---------- common alias
alias v='vim'						#vimを起動
alias vi='vim'						#vimを起動
alias vz='vim ~/.zsh/.zshrc'		#vimを起動し~/.zshrcを開く
alias dot='cd ~/dotfiles'			#dotfilesに移動
alias so='source ~/.zsh/.zshrc'		#.zshrcの読み込み
alias h='fc -lt '%F %T' 1'          #historyに日付を表示
alias cp='cp -i'					#コピー上書きする前に確認する
alias mv='mv -i'                    #移動する前に確認する
alias mkdir='mkdir -p'	#エラー表示せずディレクトリが存在しなければ作成する
alias rm='rm -i'					#削除する前に確認する
alias which='type -p'       		#検索速度が速い(らしい)
alias sudo='sudo '  			#sudoの後のコマンドでエイリアスを有効にする
alias pd='pushd'					#履歴を残して移動する
alias pp='popd'						#残された履歴に戻る
alias tarc='tar -cvzf'    			#tarで圧縮する
alias tarx='tar -xvzf'    			#tarを解凍する
alias ka9='killall -9'      		#Quit all
alias k9='kill -9'          		#Quit
alias df='df -h'		#ファイルシステムのディスク容量/単位つき
alias du='du -h -d 2'	#ディレクトリの容量/単位つき2層まで
alias q='exit' 

alias gre='grep -H -n -I --color=auto'	#grep ファイル名表示, 行数表示, バイナリファイルは処理しない
alias gdir='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'	#今迄のディレクトリ履歴を簡単に辿る(AUTO_PUSHD が必要)

# ---------- suffix 拡張子に応じたコマンドを実行してくれる
alias -s {png,jpg,jpeg}='imgcat'
alias -s {html,mp3,mp4,mov}='open'
alias -s {applescript}='osascript'
alias -s txt='bat'
#alias -s html='brave'
alias -s gz='tar -xzvf' # ./hoge.tar.gz で展開できる

# ---------- chmod パーミッション
alias 644='chmod 644'		#(rw-r--r--) 自分は読み書き、他人は読みのみ(通常file)
#alias 666='chmod 666'		#(rw-rw-rw-) 自分も他人も、読み書き(scriptが書くfile)
alias 755='chmod 755'		#(rwxr-xr-x) 誰でも読み実行、書きは自分のみ(通常dir)
alias 777='chmod 777'		#(rwxrwxrwx) 誰でもなんでもOK

# ---------- git alias
alias g='git'
alias gs='git status --short --branch'	#Gitの対象ファイルのステータスを表示
alias ga='git add -A'			#Gitに変更内容を追加する
alias gb='git branch'	       	#Gitのブランチを作成する
alias gcm='git commit -m'	    #Gitの変更内容をメッセージを付けてローカルリポジトリコミット記録する
alias gco='git checkout'		#Gitの作業ブランチを切り替えるまたは指定したコミット（もしくはインデックス）の状態を、現在の作業ツリーに展開する
alias gd='git diff'				#Gitで変更されたファイルの差分を表示
alias gsh='git show'	    	#Gitのコミットの詳細を確認
alias gp='git push'			#Gitのリモートリポジトリへプッシュする
alias gpl='git pull'            #Gitのリモートリポジトリの内容をローカルリポジトリに同期
alias gl='git log --abbrev-commit --no-merges --date=short --date=iso'  #Gitのコミット履歴を閲覧する

# ---------- Plugins etc aliases(.zshrcと.pluginsの設定のまとめ)
##alias zmv='noglob zmv -W'		#複数ファイルリネーム
##alias -g C='| pbcopy'			#クリップボードMac
##alias -g C='| xsel --input --clipboard'		#クリップボードLinux
##alias -g C='| putclip'			#クリップボードCygwin
##alias find='fd'
##alias fd='fd -iH --no-ignore-vcs -E ".git|node_modules"'
##alias grep='rg'
##alias rg='rg --hidden -g '!.git' -g '!.node_modules' --max-columns 200'
##alias cat='bat -A'
##alias ls='exa -aF --group-directories-first --icons'
##alias la='exa -aF --group-directories-first --icons'
##alias ll='exa -ahlbgF --git --time-style=iso --group-directories-first --icons'
##alias tr2='exa -ahlF --git-ignore --group-directories-first --time-style=long-iso -T -L=2 --ignore-glob=".git|node_modules" --icons'
##alias tr3='exa -alhF --git-ignore --group-directories-first --time-style=long-iso -T -L=3 --ignore-glob=".git|node_modules" --icons'
##alias ls='gls --color=auto --human-readable --group-directories-first'
##alias la='gls -aF --color=auto --human-readable --group-directories-first'
##alias ll='gls -alF --color=auto --human-readable --group-directories-first'
##alias ls='ls --color=auto --human-readable --group-directories-first'
##alias la='ls -aF --color=auto --human-readable --group-directories-first'
##alias ll='ls -alF --color=auto --human-readable --group-directories-first'
##cd	一度アクセスしたディレクトリのリストを表示
##cd -	ログ内の最後の10個のディレクトリ項目から検索
##cd .. 上位階層への移動
 
# =============== Bindkeys ================
# キーバインド/ショートカットキーの登録
# bindkey コマンドで確認できる
# C- 	⌃(control)
# \M- 	ESC と ⌥(alt/option) Meta<\M>のこと
# ⌃[	ALT		terminalでmetaキーを有効にしたら、⌃[がALTで効いた。
# たぶん'⌃X'を<Leader>のような扱いにしているっぽい

# ---------- モードの設定(デフォルトはEmacsモード)
bindkey -e		# emacs 風
#bindkey -v		# vi 風
# -v でもコマンドラインスタック使う
#bindkey 'eq' push-line

# ---------- 端末設定
stty intr '^C'			# C-C 割り込み
#stty susp '^Z'			# C-Z サスペンド -->fancy-ctrl-z
#stty quit '^\'			# C-\ 中止
stty stop undef			# C-Sによる画面の停止を無効に

# ---------- delete(backspace)を使えるように
bindkey '^?' 		backward-delete-char	#一文字消去
bindkey '^H'    	backward-delete-char	#一文字消去
bindkey '^[[3~' 	delete-char
bindkey '^[[3;5~' 	delete-word

# ---------- jump/move
bindkey '^A' 		beginning-of-line		#行末
bindkey '^B' 		backward-word			#左の単語
#bindkey '^D' 		delete-char-or-list		#一文字消去 --> _delete-char-or-list-expand
bindkey '^E' 		end-of-line				#行頭
bindkey '^F' 		forward-word			#右の単語
bindkey '^K' 		kill-line				#一行切り取り
bindkey '^N' 		down-line-or-history	#下
bindkey '^P' 		up-line-or-history		#上
bindkey '^U' 		backward-kill-line		#一行削除
bindkey '^W' 		backward-kill-word		#単語削除
bindkey '^[h' 		backward-char			#一文字左	ALT-H(ALT=META時)
bindkey '^[l' 		forward-char			#一文字右	ALT-L(ALT=META時)

# ---------- Other
bindkey '^G'		send-break
bindkey '^J'		accept-line				#改行
bindkey '^L'		clear-screen
bindkey '^M'		accept-line				#改行
bindkey '^O'		accept-line-and-down-history
bindkey '^Q'		push-line
bindkey '^V' 		quoted-insert
bindkey '^Y' 		yank
bindkey '^_' 		undo

# ---------- Plugins etc bindkey(.zshrcと.pluginsの設定のまとめ)
##bindkey '^I' 		__enhancd::completion::run
##bindkey '^R' 		fzf-history-widget
##bindkey '^S'		anyframe-widget-cdr
##bindkey '^T' 		fzf-file-widget
##bindkey '^[s'		anyframe-widget-select-widget	#ALT-S(ALT=META時)
##bindkey '^[a' 	fzf-cd-widget					#ALT-A(ALT=META時)
##bindkey '^x^b' 	anyframe-widget-checkout-git-branch
##bindkey '^x^i' 	anyframe-widget-insert-git-branch
##bindkey '^x^f' 	anyframe-widget-insert-filename
##bindkey '^x^k' 	anyframe-widget-kill
##bindkey '^x^p' 	anyframe-widget-put-history

# =============== Functions ================
# 関数とalias/bindkeyの登録

# ---------- 追加したものまとめ
##bindkey '^D' delete-char-or-list拡張
##bindkey '^Z' fancy-ctrl-z	行ったり来たり

##alias lns='ln-sfnv'	シンボリックリンクを貼る
##alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract	tarとzipをunzip
##alias rrg='rripgrep'	ripgrepでマッチしたものを選択
##alias dlgr='github-release'		github releaseをURL叩くだけで
##alias vigo='vimgo'		過去開いたvimファイルをどこからでも開けるように
##alias mkcd='mkdircd'	mkdirとcdを同時実行。ディレクトリを作って移動
##alias gdf='git-diff'	gitで差分を確認しながらステージング
##alias fsw='git-commit-browser'	見ながらコミット
##alias fad='fgitadd'		gitのdiff, add
##alias gro='git-root'	gitのルートディレクトリへ簡単に移動

# ---------- delete-char-or-list拡張
_delete-char-or-list-expand() {
    if [ -z "$RBUFFER" ]; then
        zle list-expand
    else
        zle delete-char
    fi
}
zle -N _delete-char-or-list-expand
bindkey '^D' _delete-char-or-list-expand

# ---------- シンボリックリンクを貼る
function ln-sfnv() {
    if [ -z $2 ];then echo "Specify Target.\n" && return 0;fi;
    abspath=$(echo $(cd $(dirname "$1") && pwd -P)/$(basename "$1"))
    ln -sfnv ${abspath} $2
}
#zle -N ln-sfnv
#bindkey '' ln-sfnv
alias lns='ln-sfnv'

# ---------- tarとzipをunzip
function tz() { tar zcvf ${1}.tar.gz ${1}; }
function extract() {
	case $1 in
		*.tar.gz|*.tgz) tar xzvf $1;;
		*.tar.xz) tar Jxvf $1;;
		*.zip) unzip $1;;
		*.lzh) lha e $1;;
		*.tar.bz2|*.tbz) tar xjvf $1;;
		*.tar.Z) tar zxvf $1;;
		*.gz) gzip -d $1;;
		*.bz2) bzip2 -dc $1;;
		*.Z) uncompress $1;;
		*.tar) tar xvf $1;;
		*.arj) unarj $1;;
	esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract


# ---------- ripgrepでマッチしたものを選択できるように
function rripgrep() {
    keyword=$1;
    [ -z $2 ] && matches=`rg -il ${keyword}` || matches=`rg --files | rg -i ${keyword}`;
    if [ -z ${matches} ];then echo "no matches\n" && return 0;fi;
    selected=`echo ${matches} | fzf --preview "rg -in ${keyword} {}"`;
    if [ -z ${selected} ];then echo "canceled\n" && return 0;fi;
    nvim ${selected};
}
#zle -N rripgrep
#bindkey '' rripgrep
alias rrg='rripgrep'

# ---------- github releaseをURL叩くだけでもってこれるように
function github-release() {
    URL=`curl -s "${@}" | grep "browser_download_url" | cut -d '"' -f 4 | fzf`
    curl -O ${URL}
}
#zle -N github-release
#bindkey '' github-release
alias dlgr='github-release'

# ---------- 過去開いたvimファイルをどこからでも開けるようにする
function vimgo() {
    vim -c "call append(0, v:oldfiles)" -c "write! ~/.vim/.viminfo" -c exit;
    vim "bat ~/.vim/.viminfo | fzf --preview 'bat {}'"
    ;
}
#zle -N vimgo
#bindkey '' vimgo
alias vigo='vimgo'

# ---------- mkdirとcdを同時実行。ディレクトリを作って移動
function mkdircd() {
	if [[ -d $1 ]]; then
		echo "$1 already exists!"
		cd $1
	else
		mkdir -p $1 && cd $1
	fi
}
#zle -N mkdircd
#bindkey '' mkdircd
alias mkcd='mkdircd'

# ---------- fgを使わず一つ前のバッファとctrl+zで行ったり来たりする。たとえばvimとzshを行ったり来たり(サスペンド（停止）されているジョブをフォアグラウンドで実行再開するコマンド)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# ---------- gitで差分を確認しながらステージング
git-diff() {
  modified_files=$(git status --short | awk '{print $2}') &&
  selected_files=$(echo "$modified_files" | fzf -m --preview 'git diff {}') &&
  git add $selected_files
}
#zle -N git-diff
#bindkey '' git-diff
alias gdf='git-diff'

# ---------- 見ながらコミット
git-commit-browser() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
#zle -N git-commit-browser
#bindkey '' git-commit-browser
alias fsw='git-commit-browser'

# ---------- gitのdiff, addをfzf でインタラクティブに
fgitadd() {
  local out q n addfiles
  while out=$(
      git status --short |
      awk '{if (substr($0,2,1) !~ / /) print $2}' |
      fzf-tmux --multi --exit-0 --expect=ctrl-d); do
    q=$(head -1 <<< "$out")
    n=$[$(wc -l <<< "$out") - 1]
    addfiles=(`echo $(tail "-$n" <<< "$out")`)
    [[ -z "$addfiles" ]] && continue
    if [ "$q" = ctrl-d ]; then
      git diff --color=always $addfiles | less -R
    else
      git add $addfiles
    fi
  done
}
#zle -N fgitadd
#bindkey '' fgitadd
alias fad='fgitadd'

# ---------- gitのルートディレクトリへ簡単に移動できるようにする
function git-root() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    cd `pwd`/`git rev-parse --show-cdup`
  fi
}
#zle -N git-root
#bindkey '' git-root
alias gro='git-root'

# ---------- 
# ---------- 
# ---------- 
# ---------- 
# ---------- 
