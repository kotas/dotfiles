function install_asdf {
  # asdf command is installed by homebrew
  asdf plugin add nodejs
  asdf plugin add ruby

  # For M1 Mac we can't use `asdf install`
  asdf install ruby latest
  arch -x86_64 asdf install nodejs lts
}

function update_asdf {
  asdf plugin update --all

  asdf install ruby latest
  arch -x86_64 asdf install nodejs lts
}

installers+=(asdf)
