#!/bin/zsh
set -e

cd `dirname $0`
source helper/helper.zsh

section "Symlink dotfiles"
symlink git/dot.gitconfig          ~/.gitconfig
symlink git/dot.gitignore_global   ~/.gitignore_global
symlink tmux/dot.tmux.conf         ~/.tmux.conf
symlink vim/dot.vimrc              ~/.vimrc
symlink vim/dot.vimrc.bundles      ~/.vimrc
symlink vim/dot.vim                ~/.vim
symlink zsh/dot.zshrc              ~/.zshrc
symlink rbenv/dot.gemrc            ~/.gemrc

create_dir ~/.rbenv
symlink rbenv/default-gems         ~/.rbenv/default-gems

section "Run git submodule update"
git submodule update --init

if [[ ! -e ~/.oh-my-zsh ]]; then
  section "Install oh-my-zsh"
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -h ~/.oh-my-zsh/custom ]]; then
  section "Replace ~/.oh-my-zsh/custom"
  remove_dir ~/.oh-my-zsh/custom
  symlink zsh/oh-my-zsh-custom  ~/.oh-my-zsh/custom
fi

section "Set up ~/bin"
create_dir ~/bin
rsync -acu bin/ ~/bin/

if [[ ! -e ~/bin/sdif ]]; then
  section "Install sdif"
  wget -O $HOME/bin/sdif https://raw.github.com/kaz-utashiro/sdif/master/sdif
  chmod +x ~/bin/sdif
fi

if ! which brew > /dev/null; then
  section "Install Homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

section "Run brew bundle"
brew bundle

section "Set up rbenv"
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
  RUBY_VERSION=2.1.0

  if [[ $(rbenv versions | grep -c "$RUBY_VERSION") == 0 ]]; then
    section "Install ruby $RUBY_VERSION"
    rbenv install "$RUBY_VERSION"
    rbenv global "$RUBY_VERSION"
  fi
fi

section "Set up nvm"
[[ -s "/usr/local/opt/nvm/nvm.sh" ]] && source "/usr/local/opt/nvm/nvm.sh"
if which nvm > /dev/null; then
  NODE_VERSION=`nvm ls-remote | grep v0.10 | tail -n1`

  if [[ $(nvm ls | grep -c "$NODE_VERSION") == 0 ]]; then
    section "Install node $NODE_VERSION"
    nvm install $NODE_VERSION
    nvm alias default $NODE_VERSION
    nvm use $NODE_VERSION
  fi

  section "Install npm packages"
  npm install -g mocha testem grunt bower gulp phantomjs
fi

section "Done"
echo 'Allora, ragazzi, cominciamo a lavorare!!'
