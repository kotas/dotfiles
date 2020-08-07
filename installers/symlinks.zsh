function install_symlinks {
  rcup -v -d dotfiles
}

function update_symlinks {
  install_symlinks
}

installers+=(symlinks)
