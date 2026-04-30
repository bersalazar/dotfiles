#!/usr/bin/env bash

# Ubuntu-based configuration

sudo apt update

# ===== APT =====

echo "Installing basic tools"
sudo apt install bat
sudo apt install htop
sudo apt install iftop
sudo apt install pipx
sudo apt install zsh -y

echo "Installing and configuring tmux"
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing tools that replace gnome-desktop"

# sound switcher indicator. Allows me to select which audio sources I want to use, and switch between them.
sudo apt-add-repository ppa:yktooo/ppa
sudo apt update
sudo apt install indicator-sound-switcher

# logitech mouse management driver with a UI
sudo apt install solaar

# replace Gnome Display Manager -gdm- with lightdm
# lightdm allows switching to i3 as a window manager
sudo apt install lightdm

# i3 window tile manager. Pure joy.
sudo apt install i3

# Xorg compositor. Useful to avoid screen tearing when using i3. Screen tearing is the obnoxious lines that happen in the browser when scrolling.
sudo apt install compton

# install a clipboard management tool. It allows me to use Mod+v to paste from the clipboard, otherwise I haven't found another way.
sudo apt install diodon

# install window management control for X server
sudo apt install wmctrl

# install screen auto-lock tool
sudo apt install xautolock

# install notifications management tool
sudo apt install dunst

# install a tool to query the battery level
sudo apt install acpi

# media playback controller
sudo apt install playerctl

# install Dell Display Manager utility
sudo apt install ddcutil -y

# install shutter - screenshot tool
sudo apt install shutter

# install dolphin file manager
sudo apt install dolphin

# Gnome tool removals. I no longer wish to use gnome tools.
sudo apt remove gnome-accessibility-themes
sudo apt remove gnome-bluetooth
sudo apt remove gnome-startup-applications
sudo apt remove nano

# ===== HOMEBREW =====

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install npm
brew install ripgrep
brew install git-delta
brew install typescript-language-server
brew install jdtls # java language server
brew install yaml-language-server
brew install pylsp
brew install vscode-langservers-extracted # language servers for css, html, json, markdown, etc.
brew install docker-language-server
brew install hugo # static site generator for my blog
brew install tree-sitter-cli # required by neovim checkhealth for treesitter
brew install luarocks # package manager for Lua, required for neovim plugins
brew install fd # find files in the terminal, faster than find

# ===== PIPX =====

sudo pipx install --global pyright
sudo pipx install --global argcomplete

# ===== NPM =====

sudo npm install -g bash-language-server

# ===== PIP =====

# install debugpy (python debugger)
# debugpy is not available using brew, so we install via pip.
# if Python is installed with brew, it's marked as externally managed (PEP668).
# pip normally refuses modifications in this case, so we override this with --break-system-packages.
python3 -m pip install debugpy --user --break-system-packages

# ===== GO =====

go install -v github.com/incu6us/goimports-reviser/v3@latest
go install golang.org/x/tools/gopls@latest

# ===== SYSTEM CONFIGURATION =====

# set firefox as default browser
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http
xdg-settings "set default-web-browser firefox.desktop"
