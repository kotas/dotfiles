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
function chpwd() { ls }

# svn
export SVN_EDITOR=vim

# phpbrew
[[ -s "$HOME/.phpbrew/bashrc" ]] && source "$HOME/.phpbrew/bashrc"

# pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

## Load all zsh files in env directory
for config_file ($ZSH_CUSTOM/env/*.zsh(N)) source $config_file
