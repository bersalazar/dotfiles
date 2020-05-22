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

# CLI apps
#brew install bat                               # Syntax Highlighting
#brew install openssl                           # SSL
#brew install flake8                            # Python Linter
#brew install gnupg                             # GPG Suite
brew install htop                              # Performance Monitoring
brew install iftop                             # Network Monitoring
brew install node                              # NodeJS
brew install telnet                            # Telnet
brew install tmux                              # Terminal multiplexer
brew install tree                              # Tree Command
brew install z                                 # Jump Around based on directories
brew install zsh			       # zsh shell

# GUI apps
brew cask install rectangle
brew cask install postman                      # GUI for testing apis
#brew install syncthing                         # Backup Software
#brew services start syncthing
#brew cask install hazel                        # Folder Cleanup
#open /Applications/Hazel.app/
#brew cask install quickhash                    # Hashing Program
#brew cask install safeincloud-password-manager # Password Manager
#brew cask install alfred                       # Mac os helper
#open /Applications/Alfred\ 3.app/
#brew cask install flux                         # Blue light solution
#open /Applications/Flux.app/

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