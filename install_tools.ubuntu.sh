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

# install autorandr - a tool to manage screen configurations
pip install autorandr

#
sudo apt install playerctl
