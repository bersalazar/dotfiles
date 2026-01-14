#!/usr/bin/env bash

# Ubuntu-based configuration

sudo apt update

echo "Installing basic tools"

sudo apt install bat
sudo apt install htop
sudo apt install iftop

echo "Installing and configure tmux"
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

# go formatting
go install -v github.com/incu6us/goimports-reviser/v3@latest

# install Dell Display Manager utility
sudo apt install ddcutil -y

# install zsh
sudo apt install zsh -y

# install shutter - screenshot tool
sudo apt install shutter

# install dolphin file manager
sudo apt install dolphin

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
  npm \
  ripgrep \
  git-delta
  typescript-language-server \
  jdtls \
  yaml-language-server \
  pylsp \
  vscode-langservers-extracted \
  docker-language-server \
  hugo

# install pyright using pipx as root
sudo /home/linuxbrew/.linuxbrew/bin/pipx install --global pyright

# install bash language server
sudo npm install -g bash-language-server

# set firefox as default browser
xdg-mime default firefox.desktop x-scheme-handler/https x-scheme-handler/http
xdg-settings "set default-web-browser firefox.desktop"
