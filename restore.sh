#!/bin/bash

echo 'Restoring all dot files'

echo 'neovim config'
cp -r ./nvim/* ~/.config/nvim/

echo 'rectangle'
cp ./rectangle/com.knollsoft.Rectangle.plist ~/Library/Preferences/

echo 'zshrc'
cp ./zsh/.zshrc ~/

echo 'iterm2'
cp ./iterm2/com.googlecode.iterm2.plist ~/Library/Preferences/

echo 'powerlevel10k'
cp ./powerlevel10k/.p10k.zsh ~/

echo 'git global config'
cp ./git/.gitconfig  ~/

echo 'tmux'
cp -r ./tmux/.tmux ~/
cp ./tmux/.tmux.conf ~/.tmux.conf

echo 'scripts'
cp -r ./scripts/* ~/.scripts/

echo 'karabiner-elements'
mkdir -p ~/.config/karabiner
cp ./karabiner/karabiner.json ~/.config/karabiner/

echo 'eslint'
cp ./eslint/.eslintrc.yml ~/

echo "all done!"
