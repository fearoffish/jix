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

      export HOMEBREW_GITHUB_API_TOKEN=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
    '';
  };

  programs.zoxide = import ./zoxide.nix;

  fonts.fontconfig.enable = true;
}
