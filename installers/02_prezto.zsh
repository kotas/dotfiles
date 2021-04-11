function install_prezto {
  if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  else
    pushd "${ZDOTDIR:-$HOME}/.zprezto"
    git pull --rebase --prune
    git submodule update --init --recursive
    popd
  fi

  if [ "$SHELL" != "/bin/zsh" ]; then
    # Change default shell to ZSH
    chsh -s /bin/zsh
  fi
}

installers+=(prezto)
