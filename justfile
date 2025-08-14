set unstable

[script]
install:
    set -e

    sudo apt update
    sudo apt install zsh fzf -y

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
    sudo chsh -s $(which zsh) $(whoami)

    # source "$HOME/.zshrc"
