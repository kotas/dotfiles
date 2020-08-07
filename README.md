# :herb: dotfiles by @kotas

Supports Mac only.

## Usage

To install everything:

    $ ./install

To update everything:

    $ ./update

Or, partially update:

    $ ./update node

See [installers](installers/) for details.

## Tools

- [zsh](http://www.zsh.org/) for default shell
- [Prezto](https://github.com/sorin-ionescu/prezto) for shell theme and modules
- [Homebrew](http://brew.sh/) for package management
- [rcm](https://github.com/thoughtbot/rcm) for dotfiles management
- [nodebrew](https://github.com/hokaccha/nodebrew) for Node.js version management

## Note on files

- `Brewfile` contains a list of packages installed by Homebrew.
- `dotfiles/gitconfig` contains author's name and e-mail address.
- `dotfiles/zshrc.local` is loaded at the end of `zshrc` if exists.

## License

Public domain.

Some files in `dotfiles/` are copied from Prezto project, and modified by me.
