#!/bin/bash

echo       _                                       _     _ _     _ 
echo    __| | __ _  ___ _ __ ___   ___  _ __   ___| |__ (_) | __| |
echo   / _` |/ _` |/ _ \ '_ ` _ \ / _ \| '_ \ / __| '_ \| | |/ _` |
echo  | (_| | (_| |  __/ | | | | | (_) | | | | (__| | | | | | (_| |
echo   \__,_|\__,_|\___|_| |_| |_|\___/|_| |_|\___|_| |_|_|_|\__,_|
echo
echo 	Install Tools and Utilities via Home Brew Package Manager
echo                                                       

echo [Check] Is Home Brew installed?

if ! command -v brew &> /dev/null
then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo [Define] alias to speed up installs
alias brew-get="HOMEBREW_NO_AUTO_UPDATE=1 brew install --no-quarantine"
alias brew-cask-get="HOMEBREW_NO_AUTO_UPDATE=1 brew cask install --no-quarantine"

echo [Define] utils
utils=( tree htop zsh wget git gnupg openssl tmux watch antigen curl figlet cowsay geoip ipcalc p7zip proxychains-ng openvpn )

echo [Define] languages
langs=( python python3 expect )

echo [Define] java 
brew tap adoptopenjdk/openjdk
java=( adoptopenjdk8 adoptopenjdk9 adoptopenjdk10 adoptopenjdk11 )

echo [Define] cask apps
caskapps=( 1password google-chrome powershell Firefox firefox-developer-edition paw bbedit iterm2 viscosity appzapper microsoft-teams little-snitch slack visual-studio-code superduper wireshark istat-menus zoomus )

echo [Define] testing apps
testing=( john-jumbo sslscan nmap )

echo [Installing] utils
for app in ${utils[@]} ; do brew-get $app ; done

echo [Installing] languages
for app in ${langs[@]} ; do brew-get $app ; done

echo [Installing] java
for app in ${java[@]} ; do brew-get $app ; done

echo [Installing] cask apps
for app in ${caskapps[@]} ; do brew-cask-get $app ; done

echo [Installing] testing apps
for app in ${testing[@]} ; do brew-get $app ; done


echo [Bonus] Changing screenshot location
mkdir ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots
killall SystemUIServer

echo [Finished] Done
