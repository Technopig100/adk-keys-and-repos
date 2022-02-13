#!/bin/bash

######################################################################################################################

echo "Letting pacman know ADK-Linux package keys"

sudo pacman-key --recv-keys 360DCBA5948FDE5944CA1E2E1A8DE33B5A149FDF --keyserver hkps://keyserver.ubuntu.com
sudo pacman-key --lsign-key 360DCBA5948FDE5944CA1E2E1A8DE33B5A149FDF

sudo pacman-key --recv-keys DB8C9336927412AD01764AD88C40B4EF4EF24C82 --keyserver hkps://keyserver.ubuntu.com 
sudo pacman-key --lsign-key DB8C9336927412AD01764AD88C40B4EF4EF24C82 

sudo pacman -S wget --noconfirm --needed

echo "Getting the ADK-Linux keys from the ADK-Linux repo"

sudo wget https://github.com/Technopig100/adklinux_repo/raw/main/x86_64/adk-keyring-2.1-11-any.pkg.tar.zst -O /tmp/adk-keyring-2.1-11-any.pkg.tar.zst
sudo pacman -U --noconfirm --needed /tmp/adk-keyring-2.1-11-any.pkg.tar.zst

######################################################################################################################

echo "Getting the latest adklinux mirrors file"

sudo wget https://raw.githubusercontent.com/Technopig100/adk-mirrorlist/main/etc/pacman.d/adk-mirrorlist -O /etc/pacman.d/adklinux-mirrorlist
echo '
#ADK Linux repository

#[adklinux_test_repo]
#Include = /etc/pacman.d/adklinux-mirrorlist

[adklinux_repo]
Include = /etc/pacman.d/adklinux-mirrorlist' | sudo tee --append /etc/pacman.conf
