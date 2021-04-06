#!/bin/bash
skip=1
if [[ "$SHELL" != *"zsh" ]]
then
    haszsh=$(ls /bin | grep zsh)
    if [[ "$haszsh" != "" ]]
    then
        echo "Zsh was found, but its not your default shell."
    while true
    do
        read -r -p "Make zsh your default shell? [Y/n]: " yesorno
        if [[ "$yesorno" =~ [nN](o)* ]]
        then
            echo "Skipping zsh setup."
            break
        else
            skip=0
            chsh -s /bin/zsh
            break
        fi
    done 
    else
        echo -e "\033[0;31mZsh not found. Skipping zsh setup."
    fi
else
    skip=0
fi

if [[ $skip = 0 ]]
then
    mkdir -p ~/.zsh
    ln -si ~/.dotfiles/settings/zsh/zshrc ~/.zsh/.zshrc
    ln -si ~/.dotfiles/settings/zsh/zshenv ~/.zshenv
fi
