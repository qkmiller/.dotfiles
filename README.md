# dotfiles

This contains some of the various custom configuration files that I use on my local machine. 
The term "dotfile" typically refers to a file that's name start with a period. 
Files beggining with a period are marked as hidden and the operating system will hide them from the user by default.
For example, '.zshrc' is a hidden file.

I've also included a shell script (makelinks.sh) which symlinks each file to the place their programs expect them to exist.
The '.dotfiles' folder is designed to be placed in your home directory. If it's not there, running 'sh makelinks.sh' won't work.
