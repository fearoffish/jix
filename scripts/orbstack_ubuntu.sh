#!/usr/bin/env bash

# Install build-essential and coreutils
sudo apt install -y autoconf bison build-essential coreutils jq libdb-dev libffi-dev libgdbm-dev libgdbm6 libgmp-dev libncurses5-dev libreadline-dev libreadline6-dev libsqlite3-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev openssl patch rustc sqlite3 uuid-dev wget zlib1g-dev gnupg software-properties-common

# Install asdf-vm
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3

# Add asdf to bashrc
echo -e '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo -e '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc