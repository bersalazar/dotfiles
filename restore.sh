#!/bin/bash

echo 'Restoring all dot files'

echo 'neovim config'
cp ./nvim/* ~/.config/nvim/

echo 'rectangle'
cp ./rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/

echo 'zshrc'
if test -f "$HOME/.is_personal_computer"; then
	cp ./zsh/.zshrc ~/
else
	echo "Skipping restore of .zshrc"
fi

echo 'iterm2'
cp ./iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/

echo 'powerlevel10k'
cp ./powerlevel10k/.p10k.zsh ~/ 

echo 'git global config'
cp ./git/.gitconfig  ~/
cp ./git/.gitconfig-personal ~/

echo "all done!"
