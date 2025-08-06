if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

_fish_pwd() {  # from fishy.zsh-theme
  local i pwd
  pwd=("${(s:/:)PWD/#$HOME/~}")
  if (( $#pwd > 1 )); then
    for i in {1..$(($#pwd-1))}; do
      if [[ "$pwd[$i]" = .* ]]; then
        pwd[$i]="${${pwd[$i]}[1,2]}"
      else
        pwd[$i]="${${pwd[$i]}[1]}"
      fi
    done
  fi
  echo "${(j:/:)pwd}"
}

precmd() {
  typeset -g LAST_EXIT_CODE=$?
}

_return_status() {
  case $LAST_EXIT_CODE in
    0|130|143) echo "" ;;
    *) echo "%B%F{red}[${LAST_EXIT_CODE}]%f%b" ;;
  esac
}

# ~/g/zsh-env [e]❯
PROMPT='%F{$NCOLOR}$(_fish_pwd)%f $(_return_status)%(!.#.❯) '
