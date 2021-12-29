#!/bin/bash

echo 'Creating backup folders'
mkdir -p {nvim,rectangle,zshrc,iterm2,powerlevel10k,git,tmux,qutebrowser}

echo 'Backing up all dot files'

echo 'neovim config'
cp -r ~/.config/nvim/* ./nvim/

echo 'rectangle'
cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/

echo 'zshrc'
if test -f "$HOME/.is_personal_computer"; then
  cp ~/.zshrc ./zsh/.zshrc
else
  echo "Skipping backup of .zshrc"
fi

echo 'iterm2'
cp ~/Library/Preferences/com.googlecode.iterm2.plist ./iterm2/

echo 'powerlevel10k'
cp ~/.p10k.zsh ./powerlevel10k/

echo 'git global config'
cp ~/.gitconfig ./git/
cp ~/.gitconfig-personal ./git/

echo 'tmux'
cp ~/.tmux.conf ./tmux/

echo 'qutebrowser'
cp ~/.qutebrowser/config.py ./qutebrowser/
cp -r ~/.qutebrowser/userscripts ./qutebrowser/

echo "all done!"
