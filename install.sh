#!/bin/bash

# Run install scripts
echo "Installing vimrc..."
source ./install/vim.sh
echo "Installing inputrc..."
source ./install/input.sh
echo "Installing xprofile and .Xresources..."
source ./install/x.sh
echo "Installing Git config and global gitignore..."
source ./install/git.sh
echo "Installing Tmux config..."
source ./install/tmux.sh
echo "Installing Zsh config..."
source ./install/zsh.sh
echo "Installing Newsboat config and urls..."
source ./install/newsboat.sh
echo "Installing Alacritty config..."
source ./install/alacritty.sh

# Create desktop notes
echo "Creating ~/Desktop/notes/notes.txt"
mkdir -p ~/Desktop/notes
touch ~/Desktop/notes/notes.txt
