function install_homebrew {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew bundle
}

function update_homebrew {
  brew bundle
}

installers+=(homebrew)
