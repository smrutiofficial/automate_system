#!/bin/bash

# ------------------------ packages ---------------------------------------------------------
sudo apt update -y && sudo apt upgrade -y

sudo apt install vlc zsh gnome-shell-extension-manager gnome-shell-extensions dconf-editor git curl wget build-essential gimp blender gnome-tweaks -y

sudo apt-get install -f

echo "Packages apps installed Successfully"

# --------------------------- deb files --------------------------------------------------
if [ ! -d "$HOME/Applications" ]; then
    mkdir -p "$HOME/Applications"
fi

# Change to the ~/Applications directory
cd "$HOME/Applications"

# Download files using wget
wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
wget -O mongodb-org-server.deb "https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/7.0/multiverse/binary-amd64/mongodb-org-server_7.0.14_amd64.deb"
wget -O ulauncher.deb "https://github.com/Ulauncher/Ulauncher/releases/download/5.15.7/ulauncher_5.15.7_all.deb"
wget -O jdk-21.deb "https://download.oracle.com/java/21/latest/jdk-21_linux-x64_bin.deb"
wget -O mongodb-compass.deb "https://downloads.mongodb.com/compass/mongodb-compass_1.43.6_amd64.deb"

sudo dpkg -i code.deb mongodb-org-server.deb ulauncher.deb jdk-21.deb mongodb-compass.deb

sudo apt-get install -f

echo "Downloads and installations completed!"

# ---------------------------- Node.js setup -------------------------------------------------
# Install Node.js using NodeSource repository
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify Node.js installation
node -v
npm -v

echo "Node.js installation completed!"

# ---------------------------- Flatpak setup -------------------------------------------------
sudo apt install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# ---------------------------- Flatpak install ------------------------------------------------
flatpak install flathub org.mozilla.firefox com.spotify.Client com.github.tchx84.Flatseal com.obsproject.Studio io.github.mimbrero.WhatsAppDesktop com.stremio.Stremio org.inkscape.Inkscape org.localsend.localsend_app com.google.AndroidStudio com.rafaelmardojai.Blanket rest.insomnia.Insomnia com.github.dynobo.normcap in.srev.guiscrcpy com.microsoft.Edge md.obsidian.Obsidian com.github.wwmm.easyeffects com.github.jeromerobert.pdfarranger -y

echo "Flatpak Apps installation completed!"
