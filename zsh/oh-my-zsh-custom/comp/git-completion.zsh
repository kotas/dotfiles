#
# git-completion replacement (using bash completion script)
#

if [ -f $ZSH_CUSTOM/comp/git-completion ]; then
  autoload bashcompinit
  bashcompinit
  source $ZSH_CUSTOM/comp/git-completion
fi
