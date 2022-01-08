#!/bin/bash

echo 'Restoring all dot files'

echo 'neovim config'
cp -r ./nvim/* ~/.config/nvim/

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
cp ./git/.gitconfig-work ~/

echo 'tmux'
cp ./tmux/.tmux.conf ~/.tmux.conf

echo 'qutebrowser'
cp ./qutebrowser/config.py ~/.qutebrowser/
mkdir -p ~/.qutebrowser/userscripts
cp -r ./qutebrowser/userscripts/* ~/.qutebrowser/userscripts/

echo 'mpv'
mkdir -p ~/.config/mpv
cp -r ./mpv/* ~/.config/mpv/

echo 'scripts'
cp -r ./scripts ~/.scripts/

echo 'karabiner-elements'
mkdir -p ~/.config/karabiner
cp ./karabiner/karabiner.json ~/.config/karabiner/

echo 'eslint'
cp ./eslint/.eslintrc.yml ~/

echo "all done!"
