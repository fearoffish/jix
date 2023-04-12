{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "asdf" "brew" "z"];
    };
    initExtra = ''
      export ASDF_DIR=/opt/homebrew/opt/asdf/libexec
      eval "$(/opt/homebrew/bin/brew shellenv)"
      . /opt/homebrew/opt/asdf/libexec/asdf.sh

      if [ -z "$HOMEBREW_GITHUB_API_TOKEN" ]; then echo "HOMEBREW_GITHUB_API_TOKEN is not set"; fiHOMEBREW_GITHUB_API_TOKEN is not set
    '';
  };

  programs.zoxide = import ./zoxide.nix;

  fonts.fontconfig.enable = true;
}
