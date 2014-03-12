## ZSH
unsetopt correct_all

## Locale
export LANG=en_US.UTF-8
export LANGUAGE=$LANG
export LC_TYPE=$LANG
export LC_CTYPE=$LANG

## general alias
alias lla='ls -lA'
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias vi=vim

# grep
export GREP_COLOR='1;37;41'
alias grep='grep --color=auto'

# less
export LESS='-R'

# cd
setopt auto_pushd
setopt auto_cd
setopt NO_flow_control
chpwd() { ls }

# svn
export SVN_EDITOR=vim

# phpenv
[[ -d "$HOME/.phpenv/bin" ]] && export PATH="$HOME/.phpenv/bin:$PATH" && eval "$(phpenv init -)"

# pythonbrew
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# nvm
[[ -s "/usr/local/opt/nvm/nvm.sh" ]] && source "/usr/local/opt/nvm/nvm.sh"

# boot2docker
export DOCKER_HOST=tcp://localhost:4243

# curl-ca-bundle
[[ -s "/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt" ]] && \
  export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

# alias
alias mate="$HOME/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

## Load all zsh files in env directory
for config_file ($ZSH_CUSTOM/env/*.zsh(N)) source $config_file
