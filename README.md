# :herb: dotfiles by @kotas

Supports M1 Mac only.

## Usage

To install or update everything:

    $ ./install

Or, partially:

    $ ./install node

See [installers](installers/) for details.

## Tools

- [zsh](http://www.zsh.org/) for default shell (uses `/bin/zsh`)
- [Prezto](https://github.com/sorin-ionescu/prezto) for shell theme and modules
- [Homebrew](http://brew.sh/) for package management
- [rcm](https://github.com/thoughtbot/rcm) for dotfiles management
- [asdf-vm](https://asdf-vm.com/) for version management

## Note on files

- `Brewfile` contains a list of packages installed by Homebrew.
- `~/.zshrc.local` is loaded at the end of `zshrc` if exists.

## License

Public domain.

Some files in `dotfiles/` are copied from Prezto project, and modified by me.
