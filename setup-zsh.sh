
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Link zsh theme
ln -sf ~/dotfiles/zsh/hl2.zsh-theme ~/.oh-my-zsh/themes/hl2.zsh-theme

# Overwrite the default zshrc with mine
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
