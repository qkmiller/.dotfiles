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
dir=$(dirname $(realpath $0))

prompt alacritty $dir/install/alacritty.sh
prompt bash $dir/install/bash.sh
prompt git $dir/install/git.sh
prompt input $dir/install/input.sh
prompt newsboat $dir/install/newsboat.sh
prompt tmux $dir/install/tmux.sh
prompt vim $dir/install/vim.sh
prompt xterm $dir/install/x.sh
prompt zsh $dir/install/zsh.sh
