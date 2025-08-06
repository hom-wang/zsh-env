# bash path
# export PATH="$(bash -i -c 'echo $PATH')"

ANTIGEN_FILE="$HOME/.antigen/antigen.zsh"
if [[ -f $ANTIGEN_FILE ]]; then
  source $ANTIGEN_FILE

  antigen use oh-my-zsh

  # plugins
  antigen bundle git
  # antigen bundle pip
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle Aloxaf/fzf-tab
  # antigen bundle mafredri/zsh-async@main

  # theme
  # antigen theme arrow
  # antigen theme fishy
  # antigen theme hom-wang/zsh-env themes/fishline --branch=test

  antigen apply

  # theme
  # source "$HOME/.zsh/themes/fishline.zsh-theme"
  source "$HOME/.zsh/themes/fishlite.zsh-theme"

else
  echo "Antigen not found ($ANTIGEN_FILE)"
  # mkdir -p ~/.antigen
  # curl -L git.io/antigen > ~/.antigen/antigen.zsh
fi

# ZINIT_FILE="$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# if [[ -f $ZINIT_FILE ]]; then
#   source $ZINIT_FILE
# fi

zstyle ':completion:*' menu select

# autoload -Uz compinit
# compinit -i
