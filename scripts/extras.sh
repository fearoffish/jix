#!/nix/var/nix/profiles/system/sw/bin/bash

# install homebrew if not available
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# asdf plugins and versions
if ! command -v ruby &>/dev/null; then
  asdf plugin add ruby
  asdf plugin add nodejs
  asdf plugin add golang
  asdf plugin add python
  asdf install ruby latest
  asdf install nodejs latest
  asdf install golang latest
  asdf install python latest
  asdf global ruby latest
  asdf global nodejs latest
  asdf global golang latest
  asdf global python latest
fi
