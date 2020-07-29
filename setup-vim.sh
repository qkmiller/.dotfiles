#!/bin/bash

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Make vim undo directory
mkdir -p ~/.vim/tmp/undo
# Make vim snippets directory
mkdir -p ~/.vim/snippets

ln -sf ~/dotfiles/vim/vimrc ~/.vim/vimrc
ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/snippets ~/.vim/snippets

# Install vim plugins
vim +PlugInstall +qall
