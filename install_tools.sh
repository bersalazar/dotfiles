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
brew install node    # nodejs and npm
brew install python3 # python3
brew install openjdk # Java development kit and runtime

echo "Install language servers"
brew install hashicorp/tap/terraform-ls # Terraform language server (linter)
npm i -g vscode-langservers-extracted # Includes html, css, json and eslint language servers
npm i -g bash-language-server
npm i -g pyright
npm install -g typescript typescript-language-server
npm install -g dockerfile-language-server-nodejs
npm i -g grammarly-languageserver
npm i -g jsonls
pip install python-lsp-server
#npm install -g @ansible/ansible-language-server

echo "Install linters and formatters"
brew install shellcheck                 # Bash linter
brew install shfmt                      # Bash formatter
npm install markdownlint --save-dev     # Markdown linter
pip3 install vim-vint                   # Vim linter

echo "Install tools used by neovim"
brew install fzf     # fuzzy finder
brew install repgrip # recursive search tool for finding words withing files, and other fancy stuff I haven't looked into

echo "Install GUI tools"
brew cask install rectangle   # Window resizing manager: https://rectangleapp.com
brew install --cask syncthing # Backup Software: https://syncthing.net

echo "Start services"
brew services start syncthing

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Mac specific configs
echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Other tools to install that are not included in brew"
echo "karabiner-elements: https://karabiner-elements.pqrs.org/docs/getting-started/installation/"

### Retired tools which could be useful again some day
#brew install qutebrowser      # A cute, keyboard-oriented browser: https://qutebrowser.org/
#brew install mpv              # Video player: https://mpv.io/
