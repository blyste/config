#!/bin/bash

sudo apt-get update

# Install useful tools
sudo apt-get install git vim tree silversearcher-ag tree evince gimp inkscape
sudo apt-get install terminator tmux gitk tig meld
sudo apt-get install libreoffice gedit vlc scrot maim
sudo apt-get install curl zsh htop
sudo apt-get install keepassxc
sudo apt-get install gnome-screensaver

# Install other window managers
sudo apt-get install awesome i3
sudo apt-get install pavucontrol blueman

# Install Oh-my-zsh as I rather use zsh than bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install useful packages for embedded development
sudo apt-get install minicom build-essential
sudo apt-get install libssl-dev zlib1g-dev libbluetooth-dev
sudo apt-get install libsodium-dev libusb-dev
sudo apt-get install automake
sudo apt-get install libtool-bin
sudo apt-get install autoconf
sudo apt-get install software-properties-common
sudo apt-get install openocd
sudo apt-get install dos2unix
sudo apt-get install extfat-fuse exfat-utils
sudo apt-get install tshark wireshark
# To check, depending on the plaform
# sudo apt-get install libc6:i386

# Get last version of JLinkExe / arm-none-eabi (or other toolchain)

# Useful udev rules to add
# sudo udevadm control -R && sudo udevadm trigger

# Don't forget to add user to groups (for minicom for example, ...)
# sudo usermod -a -G dialout username

# Git global configuration
git config --global color.ui true
git config --global user.name "Adele Hurabielle"
git config --global user.email "adele.hurabielle@gmail.com"
git config --global fetch.prune true
git config --glboal push.default simple

# Key generation (for github, ...)
# ssh-keygen -t rsa -b 4096 # Optional name of file -f filename
# gedit .ssh/id_rsa.pub (to copy on browser)
# ssh-agent bash -c 'ssh-add /folder/filename; git clone ...'

# Todo: install firefox with plugins (uBlock origin)
