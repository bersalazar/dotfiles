#!/usr/bin/env bash

declare -r os
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

echo "eslint"
cp ~/.eslintrc.yml ./eslint/

# OS-specific backup
echo "This OS is ${os}. Backing up OS-specific files"
if [[ "${os}" == "Linux" ]]; then
    echo "systemd/logind.conf"
    sudo cp /etc/systemd/logind.conf ./logind/

    echo "i3"
    cp ~/.i3/* ./i3/

    echo "dunst"
    cp ~/.config/dunst/dunstrc ./dunst/

else [[ "${os}" == "Darwin" ]]
    echo "iterm2"
    cp ~/Library/Preferences/com.googlecode.iterm2.plist ./iterm2/

    echo "rectangle"
    cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ./rectangle/

    echo "karabiner-elements"
    cp ~/.config/karabiner/karabiner.json ./karabiner/
fi

echo "all done!"
