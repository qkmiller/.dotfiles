#!/bin/bash

# Run all setup scripts
echo "Setting up Vim config..."
source ./install/vim.sh
echo "Setting up Git config..."
source ./install/git.sh
echo "Setting up Tmux config..."
source ./install/tmux.sh
echo "Setting up Zsh config..."
source ./install/zsh.sh
# Create notes directory and file on desktop
echo "Creating /home/$USER/Desktop/notes/notes.md"
mkdir -p ~/Desktop/notes
touch ~/Desktop/notes/notes.txt
