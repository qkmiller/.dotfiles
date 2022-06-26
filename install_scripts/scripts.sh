#!/bin/bash
mkdir -p ~/.local/bin
ln -si ~/.dotfiles/scripts/fixbacklight.sh ~/.local/bin/fixbacklight
ln -si ~/.dotfiles/scripts/fixcaps.sh ~/.local/bin/fixcaps
ln -si ~/.dotfiles/scripts/fixtouchpad.sh ~/.local/bin/fixtouchpad
ln -si ~/.dotfiles/scripts/streamaudio.sh ~/.local/bin/streamaudio
chmod +x ~/.local/bin/fixbacklight
chmod +x ~/.local/bin/fixcaps
chmod +x ~/.local/bin/fixtouchpad
chmod +x ~/.local/bin/streamaudio
