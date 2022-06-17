#!/bin/bash

echo 'Creating backup folders'
mkdir -p {nvim,rectangle,zshrc,iterm2,powerlevel10k,git,tmux,qutebrowser}

echo 'Backing up all dotfiles'

echo 'neovim config'
cp -r ~/.config/nvim/* ./nvim/

echo 'rectangle'
cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/

echo 'zshrc'
cp ~/.zshrc ./zsh/.zshrc

echo 'iterm2'
cp ~/Library/Preferences/com.googlecode.iterm2.plist ./iterm2/

echo 'powerlevel10k'
cp ~/.p10k.zsh ./powerlevel10k/

echo 'git global config'
cp ~/.gitconfig ./git/
cp ~/.gitconfig-personal ./git/
cp ~/.gitconfig-work ./git/

echo 'tmux'
cp ~/.tmux.conf ./tmux/

echo 'scripts'
cp -r ~/.scripts/* ./scripts/

echo 'karabiner-elements'
cp ~/.config/karabiner/karabiner.json ./karabiner/

echo 'eslint'
cp ~/.eslintrc.yml ./eslint/

echo "all done!"
