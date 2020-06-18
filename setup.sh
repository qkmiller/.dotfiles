#!/bin/bash

# Make vim undo directory
mkdir -p ~/.vim/tmp/undo

# Make directories before linking
mkdir -p ~/.oh-my-zsh/themes

ln -sf ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/hl2.zsh-theme ~/.oh-my-zsh/themes/hl2.zsh-theme
ln -s ~/dotfiles/vimrc ~/.vim/vimrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore_global

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


