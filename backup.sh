#!/usr/bin/env bash

set -uo pipefail

os="$(uname)"

echo "Creating backup folders"
mkdir -p {dunst,git,i3,nvim,opencode,powerlevel10k,tmux,tridactyl,xserver,zsh}

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

    echo "xserver"
    cp ~/.Xmodmap ./xserver/
    
    echo "zshrc"
    cp ~/.zshrc ./zsh/.zshrc
fi

echo "ghostty"
cp -r ~/.config/ghostty/* ./ghostty/

echo "k9s"
cp -r ~/.config/k9s/* ./k9s/

echo "opencode"
rsync -a --exclude='service.json' --exclude='auth.json' --exclude='cli.json' ~/.config/opencode/ ./opencode/

echo "tridactyl"
cp ~/.tridactylrc ./tridactyl/ 2>/dev/null || echo "no ~/.tridactylrc found, skipping"

echo "all done!"
