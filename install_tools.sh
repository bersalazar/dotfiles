#!/bin/bash

#######################
# This script is based on the wonderful https://github.com/hunttom/bodega/blob/master/developer_setup/dev_env.sh

echo "Updating system install..."
softwareupdate -ia --verbose
echo ""

echo "Installing xcode cli development tools..."
xcode-select --install
echo ""

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install CLI apps"
brew install bat     # Syntax Highlighting
brew install htop    # Performance Monitoring
brew install iftop   # Network Monitoring
brew install tmux    # Terminal multiplexer
brew install zsh     # zsh shell
brew install ansible # Configuration management tool
brew install git     # Well... it's git

echo "Install package managers and languages"
brew install node    # nodejs and npm
brew install python3 # python3
brew instakk openjdk # Java development kit and runtime

echo "Install linters and formatters"
brew install flake8                     # Python Linter
brew install shellcheck                 # Bash linter
brew install shfmt                      # Bash formatter
brew install hashicorp/tap/terraform-ls # Terraform language server (linter)
npm install markdownlint --save-dev     # Markdown linter
pip3 install vim-vint                   # Vim linter

echo "Install GUI tools"
brew cask install rectangle
#brew install syncthing # Backup Software
#brew services start syncthing

echo "Install tools used by neovim"
brew install fzf     # fuzzy finder
brew install repgrip # recursive search tool for finding words withing files, and other fancy stuff I haven't looked into

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Mac specific configs
echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
