#!/bin/bash

# Run install scripts
echo "Installing vimrc..."
source ./install/vim.sh
echo "Installing inputrc..."
source ./install/input.sh
echo "Installing xprofile..."
source ./install/x.sh
echo "Installing Git config and global gitignore..."
source ./install/git.sh
echo "Installing Tmux config..."
source ./install/tmux.sh
echo "Installing Zsh config..."
source ./install/zsh.sh

# Create desktop notes
echo "Creating ~/Desktop/notes/notes.md"
mkdir -p ~/Desktop/notes
touch ~/Desktop/notes/notes.txt
