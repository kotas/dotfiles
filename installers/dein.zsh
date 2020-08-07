function install_dein {
  mkdir -p ~/.vim/bundles
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/install_dein.sh
  sh ~/.vim/install_dein.sh ~/.vim/bundles
}

function update_dein {
}

installers+=(dein)
