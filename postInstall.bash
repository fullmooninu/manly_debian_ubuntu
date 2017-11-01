#!/usr/bin/env bash
set -v

sudo apt-get update
sudo apt install -y ntp
sudo apt-get dist-upgrade -y --fix-missing --fix-broken --purge
sudo apt install $(check-language-support)
##Standard stuff everyone should have
sudo apt install -y wget curl apt-transport-https git
#Stuff nice for machine work
sudo apt install -y ssh default-jdk-headless default-jre-headless nano lynis glances ncdu synaptic
##Extra stuff
sudo apt install -y steam chromium-browser hexchat pidgin ntp workrave
#sudo apt install -y intel-microcode # if not intel disable this!!

##Workstuff
sudo apt install -y idle3

##Sublime3 : https://www.sublimetext.com/docs/3/linux_repositories.html
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -y -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
##Keybase
curl -O https://prerelease.keybase.io/keybase_amd64.deb
# if you see an error about missing `libappindicator1`
# from the next command, you can ignore it, as the
# subsequent command corrects it
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase


##Erase old downloaded archive files
sudo apt-get autoclean -y
##Remove automatically all unused packages
sudo apt-get autoremove -y --purge
##Reboot
#sudo reboot

##TODO
# activate all repositories
# add repositories if needed
# see if that website has an api of sortes
# dist-update
# install fonts and other media ubuntu shtuff like restricted extras
# install more shtuff (skype etc, make a list)

