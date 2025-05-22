#!/usr/bin/env bash

set -euo pipefail

# Update repositories
sudo apt update && sudo apt upgrade

# Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && echo "export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH" >> ~/.zshenv
## Add Datadog tap
source ~/.zshenv
brew tap datadog/tap git@github.com:DataDog/homebrew-tap.git
brew update
## Install OrgStore CLI
brew install orgstore

# Install fzf
sudo apt install fzf

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Handle dotfiles
## Install stow
sudo apt install stow
## Delete existing dotfiles to avoid conflicts
rm ~/.tmux.conf ~/.zshrc
## Symlink dotfiles
stow --dir ~/dotfiles/dotfiles --target ~ tmux zsh
