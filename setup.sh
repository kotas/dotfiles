#!/bin/bash

cd `dirname $0`
DOTFILES_DIR=`pwd`

DOTFILES="
	git/dot.gitconfig
	git/dot.gitignore_global
	tmux/dot.tmux.conf
	vim/dot.vimrc
	vim/dot.vimrc.bundles
	vim/dot.vim
	zsh/dot.zshrc
"

echo "*** Symlinking dotfiles"
for FILE in $DOTFILES; do
	if [ -f "$FILE" -o -d "$FILE" ]; then
		DEST=`basename "$FILE"`
		DEST=~/${DEST/dot./.}

		if [ -h "$DEST" ]; then
			echo "skipped: $DEST (Already symlinked)"
		else
			ln -f -s $DOTFILES_DIR/$FILE $DEST
			echo "symlinked: $DEST"
		fi
	else
		echo "$FILE is not found!" >&2
		exit
	fi
done

if [ ! -d ~/.oh-my-zsh ]; then
	echo "*** Installing oh-my-zsh"
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ ! -h ~/.oh-my-zsh/custom ]; then
	rm -fr ~/.oh-my-zsh/custom
	echo "removed:" ~/.oh-my-zsh/custom
	ln -F -s $DOTFILES_DIR/zsh/oh-my-zsh-custom ~/.oh-my-zsh/custom
	echo "symlinked:" ~/.oh-my-zsh/custom
fi

if [ ! -d ~/bin ]; then
	mkdir ~/bin
	echo "created:" ~/bin
fi

echo "*** Copying bin/* into ~/bin/"
rsync -ac $DOTFILES_DIR/bin/ ~/bin/

if [ ! -f /usr/local/bin/brew ]; then
	echo "*** Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

if [ ! -d ~/.phpbrew ]; then
	echo "*** Installing phpbrew"
	curl -o ~/bin/phpbrew https://raw.github.com/c9s/phpbrew/master/phpbrew
	chmod +x ~/bin/phpbrew
	~/bin/phpbrew init
fi

if [ ! -d ~/.pythonbrew ]; then
	echo "*** Installing pythonbrew"
	curl -kL http://xrl.us/pythonbrewinstall | bash
fi

if [ ! -d ~/.rbenv ]; then
	echo "*** Installing rbenv"
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	git clone https://github.com/ianheggie/rbenv-binstubs.git ~/.rbenv/plugins/rbenv-binstubs
	git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
fi

if [ ! -d ~/.nvm ]; then
	echo "*** Installing nvm"
	git clone https://github.com/creationix/nvm.git ~/.nvm \
	source "$HOME/.nvm/nvm.sh"
	latest_version=`nvm ls-remote | grep v0.10 | tail -n1`
	echo "*** Installing node $latest_version"
	nvm install $latest_version
	nvm alias default $latest_version
	nvm use $latest_version
	echo "*** Installing npm packages"
	npm install -g mocha testem grunt bower gulp phantomjs
fi
