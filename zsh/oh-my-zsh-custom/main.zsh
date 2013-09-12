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

# svn
export SVN_EDITOR=vim

# phpbrew
if [ -s "$HOME/.phpbrew/bashrc" ]; then
    source "$HOME/.phpbrew/bashrc"
elif [ -d "$HOME/.phpenv/bin" ]; then
    export PATH="$HOME/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
fi

# pythonbrew
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# rbenv
[[ -d "$HOME/.rbenv/bin" ]] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"

## Load all zsh files in env directory
for config_file ($ZSH_CUSTOM/env/*.zsh(N)) source $config_file
