#!/bin/bash

# Navigate to the Downloads directory
cd ~/Downloads

# Clone the configuration repository
git clone https://github.com/smrutiofficial/dotnet_config.git

# Navigate to the .config directory inside the cloned repository
cd dotnet_config/.config

# Install tmux and fzf
sudo apt install -y tmux fzf

# Copy the nvim and tmux configurations to ~/.config/
cp -r nvim tmux ~/.config/

echo "Tmux and nvim Setup complete!"
