#!/bin/bash

ln -si ~/.dotfiles/settings/git/gitignore ~/.gitignore_global

# Add git config settings to global config
git config --global include.path "~/.dotfiles/settings/git/gitconfig"
