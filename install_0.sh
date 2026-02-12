#!/usr/bin/env sh

set -euo pipefail

function log() {
    echo "=== [$(date)] $1"
}

log "Starting installation"
log "Running as: $(whoami)"
log "Current workdir: $(pwd)"

# Update repositories
sudo apt update && sudo apt --yes upgrade
log "Updated repositories and upgraded packages"

# Install Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
log "Installed Homebrew"
## Add Homebrew to PATH for the remainder of the script
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
## Add Datadog tap
brew tap datadog/tap git@github.com:DataDog/homebrew-tap.git
brew update
## Install fx
brew install fx
## Install OrgStore CLI
brew install orgstore

# Install fzf
## Remove existing apt installation as it's outdated
sudo apt remove -y fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --completion --key-bindings --no-update-rc

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pyenv
curl -fsSL https://pyenv.run | bash

# Handle dotfiles
## Install stow
sudo apt install stow
## Delete existing dotfiles to avoid conflicts
rm ~/.tmux.conf ~/.zshrc
## Symlink dotfiles
stow --dir ~/dotfiles/dotfiles --target ~ tmux zsh

# Set up devkube
ddtool clusters use entei.us1.staging.dog
devkube use nachomas
