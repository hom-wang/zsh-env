########################################################################################################################
#
# 📦 Just Installation Guide
#
# Just is a handy command runner, similar to make, used to define and execute project-specific commands.
# Official site: https://just.systems/
#
#   Recommended version: 1.42.x or higher
#
# Installation:
#
#   🐧 Linux
#   >> curl -sSf https://just.systems/install.sh | sudo bash -s -- --to /usr/local/bin --force
#
#   🍎 macOS
#   >> brew install just
#
#   🪟 Windows (need restart terminal)
#   >> winget install --id casey.just --source winget
#
########################################################################################################################

set unstable

SILENT := "/dev/null 2>&1"

# chsh -s $(which zsh)

[linux]
install-zsh:
    @sudo apt update
    @sudo apt install zsh fzf -y
    @sudo chsh -s $(which zsh) $(whoami)

[macos]
install-zsh:
    @brew update
    @brew install zsh fzf

# config zsh
[script]
config:
    set -e

    # >> antigen
    mkdir -p ~/.antigen
    curl -L git.io/antigen > ~/.antigen/antigen.zsh

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

install: install-zsh config
