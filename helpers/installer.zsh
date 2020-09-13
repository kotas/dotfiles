autoload -Uz colors
colors

function dotfiles_run_installers {
  local operation="$1"
  shift

  local -a installers
  if [ $# -gt 0 ]; then
    for command in $*; do
      source installers/*_$command.zsh
    done
  else
    for file in $(ls installers/*.zsh); do
      source $file
    done
  fi

  for installer in $installers; do
    echo "${fg[blue]}# ----------------------------------------${reset_color}"
    echo "${fg[blue]}# ${operation} ${fg[magenta]}${installer}${reset_color}"
    echo
    ${operation}_${installer}
    echo
  done
}

function dotfiles_install {
  dotfiles_run_installers install $*
}

function dotfiles_update {
  dotfiles_run_installers update $*
}
