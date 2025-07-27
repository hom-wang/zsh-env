#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install zsh fzf sed -y

# >> antigen
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

# >> zinit
# # https://github.com/zdharma-continuum/zinit
# bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
# rm -rf ~/.local/share/zinit

# create ~/.zsh
DOTFILES_DIR="$HOME/.zsh"
mkdir -p "$DOTFILES_DIR"

rsync -avh \
    --exclude ".git" \
    --exclude "README*" \
    --exclude "figure/" \
    ./ "$DOTFILES_DIR/"

# zshrc symlink
if [ -f "$HOME/.zshrc" ]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi
ln -s "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

# zprofile symlink
if [ -e "$HOME/.zprofile" ]; then
    mv "$HOME/.zprofile" "$HOME/.zprofile.bak"
fi
ln -s "$DOTFILES_DIR/zprofile" "$HOME/.zprofile"

touch ~/.zshrc
sudo chsh -s $(which zsh) $(whoami)

# source "$HOME/.zshrc"
