#!/bin/bash

######################################################################################################################

sudo pacman -S wget --noconfirm --needed

echo "Getting the ADK-Linux keys from the ADK-Linux repo"

sudo wget https://github.com/Technopig100/adklinux_repo/tree/main/x86_64/adk-keyring-2.1-11-any.pkg.tar.zst -O /tmp/adk-keyring-2.1-11-any.pkg.tar.zst
sudo pacman -U --noconfirm --needed /tmp/adk-keyring-2.1-11-any.pkg.tar.zst

######################################################################################################################

echo "Getting the latest adklinux mirrors file"

sudo wget https://github.com/Technopig100/adk-mirrorlist/blob/main/etc/pacman.d/adk-mirrorlist -O /etc/pacman.d/adklinux-mirrorlist
echo '
#ADK Linux repository

#[adklinux_test_repo]
#Include = /etc/pacman.d/adklinux-mirrorlist

[adklinux_repo]
Include = /etc/pacman.d/adklinux-mirrorlist' | sudo tee --append /etc/pacman.conf
