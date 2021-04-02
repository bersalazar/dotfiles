#!/bin/bash

echo 'Restoring all dot files'

echo 'neovim config'
cp ./nvim/* ~/.config/nvim/

echo 'rectangle'
cp ./rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/

echo 'zshrc'
cp ./zsh/.zshrc ~/
cp ./zsh/.zshrc-personal ~/

echo 'iterm2'
cp ./iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/

echo 'powerlevel10k'
cp ./powerlevel10k/.p10k.zsh ~/ 

echo 'git global config'
cp ./git/.gitconfig  ~/
cp ./git/.gitconfig-personal ~/

echo "all done!"
