# .dotfiles

### Various configuration files.

To install everything, run setup.sh via your terminal.

Example:
```console
you@yourmachine:~/.dotfiles/$ bash setup.sh
```

If you don't want to install everything all at once, you can run the following scripts individually.
* setup-vim.sh  -  Installs Vim-plug, symlinks vimrc to ~/.vim/vimrc, and installs vim plugins.
* setup-tmux.sh -  Symlinks tmux_conf to ~/.tmux_conf.
* setup-git.sh  -  Symlinks gitignore to ~/.gitignore_global and adds .dotfiles/git/gitconfig to the global git config.
* setup-zsh.sh  -  Attempts to change the default shell to zsh. If successful, it will symlink zshrc and zshenv to ~/.zsh.
