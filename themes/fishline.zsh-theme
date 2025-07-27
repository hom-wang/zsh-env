if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

# _fish_pwd() {
#   print -n "${PWD/#$HOME/~}" | sed -E 's|/([^/])[^/]+/|/\1/|g'
# }
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

PROMPT='%F{$NCOLOR}$(_fish_pwd)%f%(!.#. ❯) '

local return_status="%B%F{red}%(?..[%?])%b%f"
RPROMPT='${return_status}%F{242}$(git_prompt_info)%f'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{yellow}*%b%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""
