##
## Command Settings
##

# shell
export LANG=ja_JP.UTF-8
export LANGUAGE=$LANG
export LC_TYPE=$LANG

# general
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

# javac
alias javac="javac -J-Dfile.encoding=UTF8"

# svn
export SVN_EDITOR=vim

