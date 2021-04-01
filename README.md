# .dotfiles

### Various configuration files and scripts.

To install everything, run **install.sh** in your terminal.

```console
you@yourhost:~$ cd .dotfiles
you@yourhost:~/.dotfiles$ bash setup-all.sh
```

If you don't want to install everything all at once, you can run the scripts 
located in the install subdirectory individually:
    * **vim.sh**   - Symlinks settings/vimrc to ~/.vim/vimrc
    * **tmux.sh**  - Symlinks settings/tmux.conf to ~/.tmux.conf
    * **git.sh**   - Symlinks settings/git/gitignore to ~/.gitignore_global 
                     and adds .dotfiles/git/gitconfig to the global git config.
    * **zsh.sh**   - Attempts to change the default shell to Zsh. 
                     If successful, symlinks settings/zsh/zshrc to ~/.zsh/.zshrc 
                     and settings/zsh/zshenv to ~/.zshenv
    * **input.sh** - Symlinks settings/inputrc to ~/.inputrc

_There are some additional scripts which aren't installed when running setup-all.sh. 
These are located in the .dotfiles/scripts folder and can be installed by running_ **_install/scripts.sh_**_._
