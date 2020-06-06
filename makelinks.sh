#!/bin/bash

# Install plug.vim
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Creat dirs
mkdir ~/.vim

# Create links
ln .vimrc ~/.vim/vimrc
if [ $SHELL != "/usr/bin/bash" ]; then
  ln ~/dotfiles/.zshrc ~/.zshrc
else
  ln ~/dotfiles/.bashrc ~/.bashrc
fi
#If windows...
if [ `uname | grep MINGW` != "" ]; then
  ln ~/dotfiles/git-prompt.sh ~/.config/git/git-prompt.sh
  ln -f vscode_settings.json ~/AppData/Roaming/Code/User/settings.json
  rm -rf ~/AppData/Roaming/Code/User/snippets
  #The only way to create directory links is with windows shell
  cmd <<< "mklink /D %userprofile%\AppData\Roaming\Code\User\snippets %cd%\vscode_snippets"
fi

