#!/bin/bash
mkdir -p ~/.local/bin
ln -si ~/.dotfiles/scripts/streamaudio.sh ~/.local/bin/streamaudio
ln -si ~/.dotfiles/scripts/capsctrl.sh ~/.local/bin/capsctrl
ln -si ~/.dotfiles/scripts/touchpad.sh ~/.local/bin/touchpad
chmod +x ~/.local/bin/streamaudio
chmod +x ~/.local/bin/capsctrl
chmod +x ~/.local/bin/touchpad
