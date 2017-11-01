#!/usr/bin/env bash
set -v

  #Requires user with sudo password

  #Distribution upgrade
sudo apt-get update
sudo apt-get dist-upgrade -y --fix-missing --fix-broken --purge

  #Erase old downloaded archive files
sudo apt-get autoclean -y

  #Remove automatically all unused packages
sudo apt-get autoremove -y --purge

  #Shutdown
sudo poweroff
#for restart use instead:
#sudo reboot
