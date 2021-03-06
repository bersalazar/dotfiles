#!/bin/bash

echo 'Backing up all dot files'

echo 'vimrc'
cp ~/.vimrc ./vim/vimrc

echo 'neovim config'
cp ~/.config/nvim/* ./nvim/

echo 'rectangle'
cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/

echo 'zshrc'
cp ~/.zshrc ./zsh/

echo 'iterm2'
cp ~/Library/Preferences/com.googlecode.iterm2.plist ./iterm2/

echo 'powerlevel10k'
cp ~/.p10k.zsh ./powerlevel10k/

echo 'git global config'
cp ~/.gitconfig ./git/
