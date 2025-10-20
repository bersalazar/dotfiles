#!/usr/bin/env bash

# This script is based on the wonderful https://github.com/hunttom/bodega/blob/master/developer_setup/dev_env.sh

echo "Updating system install..."
brew install zsh     # zsh shellsoftwareupdate -ia --verbose
echo ""

echo "Installing xcode cli development tools..."
xcode-select --install
echo ""

echo "Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install CLI apps"
brew install zsh     # zsh shell
brew install bat     # Syntax highlighting for cat command
brew install htop    # Performance monitoring
brew install iftop   # Network monitoring
brew install tmux    # Terminal multiplexer
brew install ansible # Configuration management tool
brew install git     # Well... it's git
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "Install package managers and languages"
brew install python3 # python3
brew install go

echo "Install tools used by neovim"
#brew install fzf     # fuzzy finder
#brew install repgrip # recursive search tool for finding words withing files, and other fancy stuff I haven't looked into

echo "Install LSPs"
brew install vscode-langservers-extracted
brew install bash-language-server
brew install typescript-language-server
brew install pyright

echo "Install GUI tools"
brew cask install rectangle   # Window resizing manager: https://rectangleapp.com
brew install --cask syncthing # Backup Software: https://syncthing.net
brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

echo "Start services"
brew services start syncthing

# Mac specific configs
echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

