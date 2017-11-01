#!/usr/bin/env bash
set -v

sudo apt-get update
sudo apt install -y ntp
sudo apt-get dist-upgrade -y --fix-missing --fix-broken --purge
sudo apt install $(check-language-support)
##Standard stuff everyone should have
sudo apt install -y ntp wget curl 
#Stuff nice for machine work
sudo apt install -y ssh default-jdk-headless default-jre-headless nano lynis glances ncdu
##Extra stuff
sudo apt install -y steam chromium hexchat pidgin workrave
#sudo apt install -y intel-microcode # if not intel disable this!!
##Workstuff
sudo apt install -y idle3

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

# install shtuff (skype etc, make a list)

