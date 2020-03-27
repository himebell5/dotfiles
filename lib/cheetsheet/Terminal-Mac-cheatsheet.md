# Terminal Cheatsheet for Mac (Basics)

This cheatsheet is available in many languages. Since the translation rely on volunteers, the content between the available languages may vary. Choose one below:

[terminal-mac-cheatsheet/README.markdown at master · 0nn0/terminal-mac-cheatsheet · GitHub](https://github.com/0nn0/terminal-mac-cheatsheet/blob/master/README.markdown)

- しかし日本語版はない

## English Version

------------

### SHORTCUTS

| Key/Command | Description |
| ----------- | :---------- |
| Ctrl + A   | 現在入力している行の先頭に移動します。これは、システム全体のほとんどのテキスト入力フィールドでも機能します。 1つの例外であるNetbeans。Go to the beginning of the line you are currently typing on.  This also works for most text input fields system wide.  Netbeans being one exception |
| Ctrl + E   | 現在入力している行の末尾に移動します。これは、システム全体のほとんどのテキスト入力フィールドでも機能します。 1つの例外であるNetbeans。Go to the end of the line you are currently typing on.  This also works for most text input fields system wide.  Netbeans being one exception |
| Ctrl + L   | 画面をクリアします。Clears the Screen |
| Cmd + K    | 画面をクリアします。Clears the Screen |
| Ctrl + U   | 行の先頭まですべてを後方にカット。Cut everything backwards to beginning of line |
| Ctrl + K   | 行末まですべてをカット。Cut everything forward to end of line |
| Ctrl + W   | 区切り文字として空白を使用して、1単語後方にカット。Cut one word backwards using white space as delimiter |
| Ctrl + Y   | 最後のカットコマンドでカットされたものを貼り付けます。Paste whatever was cut by the last cut command |
| Ctrl + H   | バックスペースと同じ。Same as backspace |
| Ctrl + C   | 実行中のすべてを強制終了します。また、現在の行のすべてをクリアします。Kill whatever you are running.  Also clears everything on current line |
| Ctrl + D   | 実行中のプロセスがないときに現在のシェルを終了するか、実行中のプロセスにEOFを送信します。Exit the current shell when no process is running, or send EOF to a the running process |
| Ctrl + Z   | 実行中のすべてのものを中断されたバックグラウンドプロセスに入れます。 fgはそれを復元します。Puts whatever you are running into a suspended background process. fg restores it |
| Ctrl + _   | 最後のコマンドを元に戻します。 （アンダースコア。したがって、実際にはCtrl + Shift +マイナスです）Undo the last command. (Underscore.  So it's actually Ctrl + Shift + minus) |
| Ctrl + T   | カーソルの前の最後の2文字を交換します。Swap the last two characters before the cursor |
| Ctrl + F   | カーソルを1文字前に移動。Move cursor one character forward |
| Ctrl + B   | カーソルを1文字後ろに移動。Move cursor one character backward |
| Option + →  | カーソルを1単語前に移動。Move cursor one word forward |
| Option + ←  | カーソルを1ワード後方に移動。Move cursor one word backward |
| Esc + T  | カーソルの前の最後の2単語を交換します。Swap the last two words before the cursor |
| Esc + Backspace | アルファベット文字を区切り文字として使用せずに1単語後方にカットする。Cut one word backwards using none alphabetic characters as delimiters |
| Tab  | オートコンプリートファイルとフォルダー名。Auto-complete files and folder names |



### CORE COMMANDS

| Key/Command | Description |
| ----------- | ----------- |
| cd [folder] | ディレクトリを変更します。 Change directory e.g. `cd Documents` |
| cd | ホームディレクトリ。Home directory |
| cd ~ | ホームディレクトリ。Home directory |
| cd /  | ドライブのルート。Root of drive |
| cd -  | 前のディレクトリ。Previous directory |
| ls | ショートリスト。Short listing |
| ls -l | 詳細リスト。Long listing |
| ls -a | 隠しファイルを含むリスト。 Listing incl. hidden files |
| ls -lh| 人間が読めるファイルサイズの長いリスト。Long listing with Human readable file sizes |
| ls -R | フォルダのコンテンツ全体を再帰的に。Entire content of folder recursively |
| sudo [command] | スーパーユーザー（スーパーユーザーDO）のセキュリティ権限でコマンドを実行します。Run command with the security privileges of the superuser (Super User DO) |
| open [file] | ファイルを開きます（ダブルクリックしたかのように）。Opens a file ( as if you double clicked it ) |
| top | アクティブなプロセスを表示します。 qを押して終了します。Displays active processes. Press q to quit |
| nano [file] | nanoエディターを使用してファイルを開きます。Opens the file using the nano editor |
| vim [file] | vim [file] vimエディターを使用してファイルを開きます。Opens the file using the vim editor |
| clear | 画面をクリアします。Clears the screen |
| reset | 端末の表示をリセットします。Resets the terminal display |

### CHAINING COMMANDS

| Key/Command | Description |
| ----------- | ----------- |
| [command-a]; [command-b] | Aの成功に関係なく、コマンドAを実行してからBを実行する。Run command A and then B, regardless of success of A |
| [command-a] && [command-b] | Aが成功した場合、コマンドBを実行します。Run command B if A succeeded |
| [command-a] \|\| [command-b] | Aが失敗した場合、コマンドBを実行します。Run command B if A failed |
| [command-a] & | バックグラウンドでコマンドAを実行。Run command A in background |


### PIPING COMMANDS

| Key/Command | Description |
| ----------- | ----------- |
| [command-a] \| [command-b] | コマンドAを実行し、結果をコマンドBに渡します。例：ps auxwww。Run command A and then pass the result to command B e.g ps auxwww \| grep google |

### COMMAND HISTORY

| Key/Command | Description |
| ----------- | ----------- |
| history n | 入力したものを表示します–最後のn個のアイテムを制限するために数字を追加。Shows the stuff typed – add a number to limit the last n items |
| Ctrl + r  | 以前に入力したコマンドをインタラクティブに検索します。Interactively search through previously typed commands |
| ![value] | 「value」で始まる最後に入力したコマンドを実行します。Execute the last command typed that starts with ‘value’ |
| ![value]:p | 「value」で始まる最後に入力したコマンドをコンソールに出力します。Print to the console the last command typed that starts with ‘value’ |
| !! | 最後に入力したコマンドを実行する。Execute the last command typed |
| !!:p | 最後に入力したコマンドをコンソールに出力しますPrint to the console the last command typed |

### FILE MANAGEMENT

| Key/Command | Description |
| ----------- | ----------- |
| touch [file] | 新しいファイルを作成する。Create a new file |
| pwd | 作業ディレクトリへのフルパス。Full path to working directory |
| . | 現在のフォルダー、たとえば ls。Current folder, e.g. `ls .` |
| .. | 親/囲んでいるディレクトリ、例えば ls ..。Parent/enclosing directory, e.g. `ls ..` |
| ls -l .. | 親ディレクトリの長いリスト。Long listing of parent directory |
| cd ../../ | 2レベル上に移動する。Move 2 levels up |
| cat | 画面に連結。Concatenate to screen |
| rm [file] | ファイルを削除します、例えば rm data.tmp。Remove a file, e.g. `rm data.tmp` |
| rm -i [file] | 確認して削除。Remove with confirmation |
| rm -r [dir] | ディレクトリとコンテンツを削除する。Remove a directory and contents |
| rm -f [file] | 確認なしで強制削除。Force removal without confirmation |
| cp [file] [newfile] | ファイルをファイルにコピー。Copy file to file |
| cp [file] [dir] | ファイルをディレクトリにコピー。Copy file to directory |
| mv [file] [new filename] | 移動/名前変更、例 mv file1.ad / tmp。Move/Rename, e.g. `mv file1.ad /tmp` |
| pbcopy < [file] | ファイルの内容をクリップボードにコピーします。Copies file contents to clipboard |
| pbpaste | ファイルの内容をクリップボードにコピーします。Paste clipboard contents |
| pbpaste > [file] | クリップボードの内容をファイルに貼り付け。Paste clipboard contents into file, `pbpaste > paste-test.txt` |

### DIRECTORY MANAGEMENT

| Key/Command | Description |
| ----------- | ----------- |
| mkdir [dir] | 新しいディレクトリを作成。Create new directory |
| mkdir -p [dir]/[dir] | ネストされたディレクトリを作成する。Create nested directories |
| rmdir [dir] | ディレクトリを削除します（空のディレクトリでのみ動作します）。Remove directory ( only operates on empty directories ) |
| rm -R [dir] | ディレクトリとコンテンツを削除する。Remove directory and contents |
| less [file]| 画面サイズのチャンクで配信される出力ファイルコンテンツ。Output file content delivered in screensize chunks |
| [command] > [file] | 出力をファイルにプッシュします。上書きされることに注意してください。Push output to file, keep in mind it will get overwritten |
| [command] >> [file] | 出力を既存のファイルに追加する。Append output to existing file |
| [command] < [file] | ファイルからコンテンツを読み取るようにコマンドに指示する。Tell command to read content from a file |

### SEARCH

| Key/Command | Description |
| ----------- | ----------- |
| find [dir] -name [search_pattern] | ファイルを検索します。 / Users -name "file.txt"を検索します。Search for files, e.g. `find /Users -name "file.txt"` |
| grep [search_pattern] [file] | パターンを含むすべての行を検索します。 grep "Tom" file.txt。Search for all lines that contain the pattern, e.g. `grep "Tom" file.txt` |
| grep -r [search_pattern] [dir] | 指定したディレクトリ内のすべてのファイルで、パターンを含むすべての行を再帰的に検索します。Recursively search in all files in specified directory for all lines that contain the pattern |
| grep -v [search_pattern] [file] | パターンを含まないすべての行を検索します。Search for all lines that do NOT contain the pattern |
| grep -i [search_pattern] [file] | 大文字と小文字を区別しないパターンを含むすべての行を検索します。Search for all lines that contain the case-insensitive pattern |
| mdfind [search_pattern] | ファイル（名前、コンテンツ、その他のメタデータ）のSpotlight検索。 mdfindスケートボード。Spotlight search for files (names, content, other metadata), e.g. `mdfind skateboard` |
| mdfind -onlyin [dir] -name [pattern] | 指定されたディレクトリ内のパターンのような名前のファイルのSpotlight検索。Spotlight search for files named like pattern in the given directory |

### HELP

| Key/Command | Description |
| ----------- | ----------- |
| [command] -h | ヘルプを提供します。Offers help |
| [command] --help | ヘルプを提供します。Offers help |
| info [command] | ヘルプを提供します。Offers help |
| man [command] | [コマンド]のヘルプマニュアルを表示します。Show the help manual for [command] |
| whatis [command] | [command]の1行の説明を提供します。Gives a one-line description of [command] |
| apropos [search-pattern] | 説明にキーワードを含むコマンドを検索します。Searches for command with keywords in description |



---

# My Configuration

## Zsh Plugin keybind

| Key/Command | Description |
| ----------- | ----------- |
|             |             |
|             |             |
|             |             |
|             |             |
|             |             |
|             |             |
|             |             |
|             |             |
|             |             |





## Other keymap





---




