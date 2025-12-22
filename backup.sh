#!/usr/bin/env bash

set -euo pipefail

os="$(uname)"

echo "Creating backup folders"
mkdir -p {dunst,git,i3,nvim,powerlevel10k,tmux,xserver,zsh}

echo "Backing up dotfiles..."

# OS-specific backup
echo "This OS is ${os}. Backing up OS-specific files"
if [[ "${os}" == "Linux" ]]; then
    echo "dunst"
    cp ~/.config/dunst/dunstrc ./dunst/

    echo "git global config"
    cp ~/.gitconfig ./git/

    echo "i3"
    cp ~/.i3/* ./i3/

    echo "powerlevel10k"
    cp ~/.p10k.zsh ./powerlevel10k/
    
    echo "tmux"
    cp ~/.tmux.conf ./tmux/

    echo "xserver"
    cp ~/.Xmodmap ./xserver/
    
    echo "zshrc"
    cp ~/.zshrc ./zsh/.zshrc

    echo "gnome-terminal"
    dconf dump /org/gnome/terminal/ > ./gnome-terminal/gnome-terminal.dconf
    # to restore: 
    # dconf load /org/gnome/terminal/ < gnome-terminal/gnome-terminal.dconf
fi

echo "neovim config"
cp -r ~/.config/nvim/* ./nvim/

echo "ghostty"
cp -r ~/.config/ghostty/* ./ghostty/

echo "all done!"
