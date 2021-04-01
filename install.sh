#!/bin/bash

# Run install scripts
echo "Installing vimrc..."
source ./install/vim.sh
echo "Installing inputrc..."
source ./install/input.sh
echo "Installing Git config and global gitignore..."
source ./install/git.sh
echo "Installing Tmux config..."
source ./install/tmux.sh
echo "Installing Zsh config..."
source ./install/zsh.sh

# Create notes directory and file on desktop
echo "Creating ~/Desktop/notes/notes.md"
mkdir -p ~/Desktop/notes
touch ~/Desktop/notes/notes.txt
