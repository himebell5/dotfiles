# Auto-setup

Auto(?) setup system for macOS/ Linux Voyager

## macOS version

macOS HighSierra 10.13.6

## Installation

Download dotfiles:

```
$ curl -fsSLo "${HOME}/dotfiles.tar.gz" "https://github.com/himebell5/dotfiles/tarball/master"
	or
$ sh "{Somewhere}/dep_init.sh" download
	or
$ chmod -x "{Somewhere}/dep_init.sh" && "{Somewhere}/dep_init.sh" download
```

OS setup: defaults write.../sudo

```	
$ sh ${HOME}/dotfiles/bin/os_setup.sh
```

Deploy: dotfailes deploy (symlink to home dir)

```
$ sh ${HOME}/dotfiles/bin/dep_init.sh deploy
```

Initialize: Homebrew & Application etc install/ apt-get or Linuxbrew?

```
$ sh ${HOME}/dotfiles/bin/dep_init.sh initialize
```
Update apps and settings:

```
$ sh ${HOME}/dotfiles/bin/os_setup.sh
```

vim plugin install:

```
:PlugInstall (after vim boot)
```

zsh plugin install:

```
exec zsh
```



## Apps config file

| Apps | Config | Remarks |
|:----------:|:-----------|:-------------|
|Mail|~/Library/Mail/V2<br />~/Library/Mail/V3<br />~/Library/Containers/com.apple.mail|No save password|
|keychain Access|~/Library/Keychains/*.keychain<br>or iCloud|keychain password is login password|
|AddressBook|~/Library/Application Support/AddressBook/*<br>or iCloud|-|

## Apps data file

| Apps | Data | Remarks |
|:----------:|:-----------|:-------------|
|Note|~/Library/Group Containers/group.com.apple.notes<br>~/Library/Containers/com.apple.Notes|-|
|Safari|~/Library/Safari/Bookmarks. plist<br>~/Library/Safari/ReadingListArchives|-|
|Alfred 3|~/Library/Application\ support/Alfred 3/|-|
|Bear|~/Library/Containers/net.shinyfrog.bear/Data/Documents/Application Data/database.sqlite.|-|
|nvALT|~/Library/Application\ support/nvALT/ <br />~/Library/Application\ support/Notational Data/<br />~/Library/Preferences/net.elasticthreads.nv.plist|-|
|Enpass|~/Library/Containers/in.sinew.Enpass-Desktop/Data/Library/walletx.db.|-|
|Airmal |~/Library/Containers/it.bloop.airmail.beta11/Data/Library/|-|
|Clipy |~/Library/Application\ support/Clipy<br />~/Library/Preferences/com.clipy-app.Clipy.plist||
|Typora |~/Library/Application\ support/abnerworks.Typora/themes||