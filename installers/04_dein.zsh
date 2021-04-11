function install_dein {
  if [ ! -d ~/.vim/bundles ]; then
    mkdir -p ~/.vim/bundles
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.vim/install_dein.sh
    sh ~/.vim/install_dein.sh ~/.vim/bundles
  else
    ls -d ~/.vim/bundles/repos/github.com/*/* | while read dir; do
      pushd "$dir"
      git pull --rebase --prune
      popd
    done
  fi
}

installers+=(dein)
