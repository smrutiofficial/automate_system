#!/bin/bash

# ---------------------------- themes --------------------------------------
if [ ! -d "~/.themes" ]; then
    mkdir -p ~/.themes
fi
cd ~/.themes
git clone https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme.git
cd Everforest-GTK-Theme/themes/
./install.sh
echo "Everforest-GTK-Theme is setup successfully"

# --------------------------- icons ----------------------------------------
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git
unzip WhiteSur-icon-theme.zip -d ~/.themes
cd ~/.themes/WhiteSur-icon-theme-master
./install.sh
echo "WhiteSur-icon is setup successfully"

# --------------------------- flatpak app themes override -------------------
sudo flatpak override --filesystem= ~/.themes
