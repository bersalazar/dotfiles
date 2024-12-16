#!/usr/bin/env bash

set -euo pipefail

os="$(uname)"

echo "Creating backup folders"
mkdir -p {eslint,git,i3,iterm2,karabiner,logicprox,logind,nvim,powerlevel10k,rectangle,scripts,tmux,zsh}

echo "Backing up all dotfiles"

echo "neovim config"
cp -r ~/.config/nvim/* ./nvim/

echo "zshrc"
cp ~/.zshrc ./zsh/.zshrc

echo "powerlevel10k"
cp ~/.p10k.zsh ./powerlevel10k/

echo "git global config"
cp ~/.gitconfig ./git/

echo "tmux"
cp ~/.tmux.conf ./tmux/

echo "input-leap"
cp ~/inputleap.conf ./inputleap/

# OS-specific backup
echo "This OS is ${os}. Backing up OS-specific files"
if [[ "${os}" == "Linux" ]]; then
    echo "i3"
    cp ~/.i3/* ./i3/

    echo "dunst"
    cp ~/.config/dunst/dunstrc ./dunst/

else [[ "${os}" == "Darwin" ]]
    echo "rio"
    cp "$HOME/config/rio/config.toml" ./rio/

    echo "rectangle"
    cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/
fi

echo "all done!"
