#!/bin/bash
ln -si ~/.dotfiles/settings/git/gitignore ~/.gitignore_global
git config --global include.path "~/.dotfiles/settings/git/gitconfig"
