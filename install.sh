#!/bin/bash

prompt() {
    running=1
    while [ $running == 1 ]
    do
        userprompt=$(read -e -p Install\ $1\ config\ files?\ \[Y/n]:; echo $REPLY)
        case $userprompt in
            [yY][eE][sS]|[yY]|"")
                running=0
                printf "Installing $1...\n"
                source $2
            ;;
            [nN][oO]|[nN])
                running=0
                printf "\033[1;31mSkipping $1...\033[0m\n"
            ;;
            *)
                echo "Invalid input."
        esac
    done
}

prompt alacritty ./install/alacritty.sh
prompt bash ./install/bash.sh
prompt git ./install/git.sh
prompt input ./install/input.sh
prompt newsboat ./install/newsboat.sh
prompt tmux ./install/tmux.sh
prompt vim ./install/vim.sh
prompt xterm ./install/x.sh
prompt zsh ./install/zsh.sh
