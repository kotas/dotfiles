ZSH=$HOME/.oh-my-zsh
ZSH_THEME="wedisagree"
plugins=(git osx ruby sublime)
source $ZSH/oh-my-zsh.sh

unsetopt correct_all

export PATH=$HOME/bin:/usr/local/bin:$PATH
