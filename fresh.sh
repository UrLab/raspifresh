#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run script with sudo"
	exit 1
fi

user_home=$(eval echo ~$SUDO_USER)

sudo apt update && sudo apt full-upgrade
sudo apt install vim git python3
sudo ln -s /bin/vim /bin/v
sudo apt purge nano
sudo ln -s /bin/vim /bin/nano

git clone https://github.com/urlab/config-files.git
cp config-files/.vimrc $user_home/.vimrc
cp config-files/.bashrc $user_home/.bashrc
cp config-files/.bash_aliases $user_home/.bash_aliases
rm -rf config-files

