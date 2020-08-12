#!/bin/bash

echo "Changing shell to ZSH. You may need to enter your password..."
chsh -s $(dirname $SHELL)/zsh
# If zsh is not installed, install it and set it as the default shell
if [[ "$SHELL" != *"zsh" ]]
then
  echo -e "\033[0;31mZSH not found"
  echo -e "\033[0;31mSkipping setup for ZSH"
else
  mkdir ~/.zsh
  ln -sf ~/.dotfiles/zsh/zshenv ~/.zshenv
  # Make .zshrc show up as zshrc
  ln -sf ~/.dotfiles/zsh/zshrc ~/.zsh/.zshrc
fi

