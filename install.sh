#!/bin/bash

# Update Ubuntu
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install -y zsh tmux build-essential unzip ripgrep gh 

# Set zsh as default shell
chsh -s "$(which zsh)" "$USER"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Fetch .zshrc from the repo
curl -o ~/.zshrc https://raw.githubusercontent.com/mvahaste/nvim/main/other/.zshrc 

# Fetch tmux.conf from the repo
mkdir -p ~/.config/tmux
curl -o ~/.config/tmux/tmux.conf https://raw.githubusercontent.com/mvahaste/nvim/main/other/tmux.conf
