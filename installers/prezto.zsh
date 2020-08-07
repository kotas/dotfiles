function install_prezto {
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

  # Change default shell to ZSH
  chsh -s /usr/local/bin/zsh
}

function update_prezto {
  pushd "${ZDOTDIR:-$HOME}/.zprezto"
  git pull --rebase --prune
  git submodule update --init --recursive
  popd
}

installers+=(prezto)
