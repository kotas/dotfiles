#!/bin/bash

cd `dirname $0`
DOTFILES_DIR=`pwd`

DOTFILES="
	git/dot.gitconfig
	git/dot.gitignore_global
	vim/dot.vimrc
	zsh/dot.zshrc
"
for FILE in $DOTFILES; do
	if [ -f "$FILE" ]; then
		DEST=`basename "$FILE"`
		DEST=~/${DEST/dot./.}
		ln -f -s $DOTFILES_DIR/$FILE $DEST
		echo "symlinked: $DEST"
	else
		echo "$FILE is not found!" >&2
	fi
done

if [ -d ~/.oh-my-zsh ]; then
	if [ -d ~/.oh-my-zsh/custom ]; then
		rm -fr ~/.oh-my-zsh/custom
		echo "removed:" ~/.oh-my-zsh/custom
	fi
	ln -F -s $DOTFILES_DIR/zsh/oh-my-zsh-custom ~/.oh-my-zsh/custom
	echo "symlinked:" ~/.oh-my-zsh/custom
fi
