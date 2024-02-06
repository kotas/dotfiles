function install_nodejs {
  mise use --global node@lts

  npm install -g \
    yarn \
    typescript \
    ts-node \
    git-split-diffs \
    ;
}

installers+=(nodejs)
