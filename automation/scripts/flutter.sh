#!/bin/bash

# Update and upgrade the system
sudo apt-get update -y && sudo apt-get upgrade -y

# Install required packages
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
sudo apt-get install -y libc6:amd64 libstdc++6:amd64 libbz2-1.0:amd64 libncurses5:amd64

# Download the Flutter SDK to the Downloads folder
wget -P ~/Downloads https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.1-stable.tar.xz

# Extract the tar.xz file into the ~/development/ directory
mkdir -p ~/development
tar -xf ~/Downloads/flutter_linux_3.24.1-stable.tar.xz -C ~/development/

# Add Flutter to the PATH
echo 'export PATH="$HOME/development/flutter/bin:$PATH"' >> ~/.zshenv
source ~/.zshenv

# Run Flutter Doctor
flutter doctor --android-licenses
flutter doctor
