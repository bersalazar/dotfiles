#!/usr/bin/env bash

set -euo pipefail

os="$(uname)"

echo "Creating backup folders"
mkdir -p {eslint,git,i3,iterm2,karabiner,logicprox,logind,nvim,powerlevel10k,rectangle,scripts,tmux,zsh}

echo "Backing up dotfiles..."

# OS-specific backup
echo "This OS is ${os}. Backing up OS-specific files"
if [[ "${os}" == "Linux" ]]; then
    echo "zshrc"
    cp ~/.zshrc ./zsh/.zshrc
    
    echo "git global config"
    cp ~/.gitconfig ./git/

    echo "powerlevel10k"
    cp ~/.p10k.zsh ./powerlevel10k/
    
    echo "tmux"
    cp ~/.tmux.conf ./tmux/
    
    echo "i3"
    cp ~/.i3/* ./i3/

    echo "dunst"
    cp ~/.config/dunst/dunstrc ./dunst/

elif [[ "${os}" == "Darwin" ]]; then
    echo "rectangle"
    cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/
fi

# dotfiles that apply to both linux and darwin

echo "neovim config"
cp -r ~/.config/nvim/* ./nvim/

echo "all done!"
