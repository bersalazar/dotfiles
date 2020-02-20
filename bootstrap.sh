echo "Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

echo "Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "iTerm2"
brew cask install iterm2
# Import the profile on ./iterm2/Profiles.json into iterm2 Preferences > Profiles > Other Actions > Import JSON Profiles

echo "Rectangle"
brew cask install rectangle
cp ./rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist

echo "bashrc"
read -p "At work?" -n 1 -r; echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  cp ./bashrc/bashrc.work ~/.bashrc
else
  cp ./bashrc/bashrc.home ~/.bashrc
fi
