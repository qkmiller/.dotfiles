#!/bin/bash

# Install plug.vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Creat dirs
mkdir -p ~/.vim

# Create links
if [ $SHELL != "/usr/bin/bash" ]; then
  ln -s ./.zshrc ~/.zshrc
else
  ln -s ./.bashrc ~/.bashrc
fi
ln -s .vimrc ~/.vim/vimrc

