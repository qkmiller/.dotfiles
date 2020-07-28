#!/bin/bash

# Make vim undo directory
mkdir -p ~/.vim/tmp/undo

ln -s ~/dotfiles/vim/vimrc ~/.vim/vimrc
ln -s ~/dotfiles/vim/snippets ~/.vim/snippets

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall
