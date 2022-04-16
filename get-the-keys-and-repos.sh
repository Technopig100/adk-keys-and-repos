#!/bin/bash

######################################################################################################################

echo "Letting pacman know ADK-Linux package keys"

sudo pacman-key --recv-keys 0A74C5909A8A2600AD012AF67B22BF2F72D54DAC --keyserver hkps://keyserver.ubuntu.com
sudo pacman-key --lsign-key 0A74C5909A8A2600AD012AF67B22BF2F72D54DAC

sudo pacman-key --recv-keys DB8C9336927412AD01764AD88C40B4EF4EF24C82 --keyserver hkps://keyserver.ubuntu.com 
sudo pacman-key --lsign-key DB8C9336927412AD01764AD88C40B4EF4EF24C82 

sudo pacman -S wget --noconfirm --needed

echo "Getting the ADK-Linux keys from the ADK-Linux repo"

#sudo wget https://github.com/Technopig100/adklinux_repo/raw/main/x86_64/adklinux-keyring-git* -O /tmp/adklinux-keyring-git*
#sudo pacman -U --noconfirm --needed /tmp/adklinux-keyring-git*

######################################################################################################################

echo "Getting the latest adklinux mirrors file"

sudo wget https://raw.githubusercontent.com/Technopig100/adk-mirrorlist/main/etc/pacman.d/adklinux-mirrorlist -O /etc/pacman.d/adklinux-mirrorlist
echo '
#ADK Linux repository

#[adklinux_test_repo]
#Include = /etc/pacman.d/adklinux-mirrorlist

[adklinux_repo]
Include = /etc/pacman.d/adklinux-mirrorlist' | sudo tee --append /etc/pacman.conf

sudo pacman -Syy adklinux-keyring-git --noconfirm --needed

