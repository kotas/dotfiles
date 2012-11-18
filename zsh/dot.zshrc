ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
plugins=(git osx ruby rbenv sublime brew bundler composer)
source $ZSH/oh-my-zsh.sh

unsetopt correct_all

export PATH=$HOME/bin:/usr/local/bin:$PATH
