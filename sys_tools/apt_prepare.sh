#!/bin/bash
# Prepare a new system by installing everything I regularly use onto it
# Intended for Ubuntu 14.04+

echo "Doing pre-install upgrades"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

echo "Installing all packages now"
sudo apt install -y htop terminator tree shellcheck vim git lynx irssi gawk sox zip unzip pandoc alien rpm
sudo apt install -y xclip xz-utils audacity lame flac thunderbird chromium-browser
sudo apt install -y default-jdk gradle groovy junit # Java
sudo apt install -y rustc cargo rust-gdb # Rust
sudo apt install -y python3 python3-pip pypy pylint pylint3 pydf # Python
sudo apt install -y sqlite sqlite3 postgresql-* # Databases

echo "Cleaning Up" &&
    sudo apt-get -f install &&
    sudo apt-get -y autoremove &&
    sudo apt-get -y autoclean &&
    sudo apt-get -y clean

echo "Done!"
