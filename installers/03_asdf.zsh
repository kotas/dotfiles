function install_asdf {
  # asdf command is installed by homebrew
  asdf plugin add nodejs || true
  asdf plugin add ruby   || true
  asdf plugin update --all

  # For M1 Mac we can't use `asdf install`
  asdf install ruby latest
  arch -x86_64 asdf install nodejs lts
}

installers+=(asdf)
