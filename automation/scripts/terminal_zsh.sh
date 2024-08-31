#!/bin/bash

# Update package lists
sudo apt update

# Install Zsh
echo "Installing Zsh..."
sudo apt install -y zsh

# Create a folder for Zsh fonts
mkdir -p ~/zsh_font
cd ~/zsh_font

# Download MesloLGS NF fonts
echo "Downloading MesloLGS NF fonts..."
curl -fLo "MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -fLo "MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -fLo "MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -fLo "MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Install the fonts
echo "Installing the fonts..."
mkdir -p ~/.local/share/fonts
cp *.ttf ~/.local/share/fonts/
fc-cache -fv

# Set terminal font to MesloLGS NF Regular
echo "Setting terminal font to MesloLGS NF Regular..."
gsettings set org.gnome.desktop.interface monospace-font-name 'MesloLGS NF Regular 11'

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
echo "Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set Zsh theme to Powerlevel10k in .zshrc
echo "Setting Zsh theme to Powerlevel10k..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Change default shell to Zsh
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

echo "Setup complete! Please restart your terminal or log out and back in for changes to take effect."
