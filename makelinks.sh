#!/bin/bash

# Install plug.vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Creat dirs
mkdir -p ~/.vim

# Create links
ln .vimrc ~/.vim/vimrc
if [ $SHELL != "/usr/bin/bash" ]; then
  ln ~/dotfiles/.zshrc ~/.zshrc
else
  ln ~/dotfiles/.bashrc ~/.bashrc
fi
if [ `uname | grep MINGW` != "" ]; then
  ln ~/dotfiles/git-prompt.sh ~/.config/git/git-prompt.sh
fi

