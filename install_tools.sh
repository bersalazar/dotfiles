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
brew install bat                               # Syntax Highlighting
brew install flake8                            # Python Linter
brew install htop                              # Performance Monitoring
brew install iftop                             # Network Monitoring
brew install tmux                              # Terminal multiplexer
brew install zsh			                   # zsh shell

echo "Install GUI tools"
brew cask install rectangle
#brew install syncthing                         # Backup Software    
#brew services start syncthing

echo "Install tools used by neovim"
brew install fzf        # fuzzy finder
brew install repgrip    # recursive search tool for finding words withing files, and other fancy stuff I haven't looked into

# zsh config
echo '$(which zsh)' >> /etc/shells
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"       # Oh my zsh install
echo 'alias upd="brew update; brew upgrade; brew cask upgrade; mas upgrade; brew cleanup --prune-prefix; brew doctor; brew cleanup;' >> ~/.zshrc
echo 'alias weather="curl wttr.in/Tarrytown:NewYork"' >> ~/.zshrc
echo 'alias rst="source ~/.zshrc"' >> ~/.zshr

# install vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# iterm config
git clone https://github.com/morhetz/gruvbox-contrib; cp gruvbox-contrib/iterm2/gruvbox-dark.itemcolors
echo "Go to iTerm2 preferences > Profiles > Colors > Color Presets > Import gruvbox-dark.itemcolors"

# Mac specific configs
echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
