# .dotfiles

### Various configuration files and scripts.

To install everything, run **setup-all.sh** in your terminal.

```console
[you@yourhost ~]$ cd .dotfiles
[you@yourhost .dotfiles]$ bash setup-all.sh
```

If you don't want to install everything all at once, you can run the following scripts individually.
* **setup-vim.sh**  - Symlink ~/.dotfiles/vim/vimrc to ~/.vim/vimrc
* **setup-tmux.sh** - Symlink ~/.dotfiles/tmux/tmux.conf to ~/.tmux.conf
* **setup-git.sh**  - Symlink gitignore to ~/.gitignore_global 
                  and add .dotfiles/git/gitconfig to the global git config.
* **setup-zsh.sh**  - Attempt to change the default shell to Zsh. 
                  If successful, symlink .zsh/zshrc to ~/.zsh/.zshrc 
                  and .zsh/zshenv to ~/.zshenv

_There are some additional scripts which aren't installed when running setup-all.sh. These are located in the .dotfiles/scripts folder and can be installed by running_ **_setup-scripts.sh_**_._
