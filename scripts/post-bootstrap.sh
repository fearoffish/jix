#!/nix/var/nix/profiles/system/sw/bin/bash

# asdf plugins and versions
if ! command -v go &> /dev/null; then
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

# install git mob
npm install --global git-mob
