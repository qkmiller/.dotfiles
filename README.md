# dotfiles

This contains some of the various custom configuration files that I use on my local machine. 
The term "dotfile" typically means a file that's name start with a period. 
If a file begins with a period, it's marked as a hidden file and the operating system will hide it from the user by default.
For example, '.zshrc' is a hidden file.

I've also included a shell script (makelinks.sh) which symlinks each file to where the programs expect them to be found.
The '.dotfiles' folder is designed to be placed in your home directory. If it's there, then 'makelinks.sh' won't work.
