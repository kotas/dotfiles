# :herb: dotfiles by @kotas

## Usage

To install or update everything:

    $ ./install

Or, partially:

    $ ./install homebrew

See [installers](installers/) for details.

## Tools

- [zsh](http://www.zsh.org/) for default shell (uses `/bin/zsh`)
- [Sheldon](https://sheldon.cli.rs/) for shell plugin management
- [Starship](https://starship.rs/) for shell prompt
- [Homebrew](http://brew.sh/) for package management
- [rcm](https://github.com/thoughtbot/rcm) for dotfiles management
- [mise](https://mise.jdx.dev/) for language version management

## Note on files

- `Brewfile` contains a list of packages installed by Homebrew.
- `~/.zshrc.local` is loaded at the end of `zshrc` if exists.

## License

Public domain.
