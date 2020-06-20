#!/bin/bash

# Make vim undo directory
mkdir -p ~/.vim/tmp/undo

# Make directories before linking
mkdir -p ~/.oh-my-zsh/themes

# Create symlinks
ln -s ~/dotfiles/zsh/hl2.zsh-theme ~/.oh-my-zsh/themes/hl2.zsh-theme
ln -s ~/dotfiles/vim/vimrc ~/.vim/vimrc
ln -s ~/dotfiles/git/gitignore ~/.gitignore_global

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Overwrite the default zshrc with mine
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc

# Add git config settings to global config
git config --global include.path "~/dotfiles/git/git/gitconfig"
