function install_symlinks {
  rcup -v -d dotfiles
}

installers+=(symlinks)
