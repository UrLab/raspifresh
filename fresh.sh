#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Please run script with sudo"
	exit 1
fi

user_home=$(eval echo ~$SUDO_USER)

# All useful packages not installed by default
packages="vim git python3 curl nmap g++ make python3-pip ffmpeg htop btop wget zip unzip gpg neofetch tar pass"

if [[ -z "$1" ]]; then
	sudo apt update && sudo apt full-upgrade
	for package in $packages; do
		sudo apt install $package
	done
else
	sudo apt update && sudo apt full-upgrade -y
	sudo apt install -y $packages
fi	

sudo ln -s /bin/vim /bin/v
sudo apt purge nano
sudo ln -s /bin/vim /bin/nano


git clone https://github.com/urlab/config-files.git
cp config-files/.vimrc $user_home/.vimrc
cp config-files/.bashrc $user_home/.bashrc
cp config-files/.bash_aliases $user_home/.bash_aliases
rm -rf config-files

neofetch

