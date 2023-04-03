{ config, lib, pkgs, inputs, ... }: {
  programs.direnv = import ./direnv.nix;
  programs.starship = import ./starship;
  programs.fzf.enable = true;
  programs.fzf.enableFishIntegration = true;
  programs.fish = {
    enable = true;

    functions = import ./functions.nix { inherit inputs lib; };
    shellAliases = import ./aliases.nix;
    shellAbbrs = import ./abbrs.nix;

    interactiveShellInit = ''
      set -g fish_key_bindings fish_hybrid_key_bindings

      eval "$(/opt/homebrew/bin/brew shellenv)"

      # asdf
      source /opt/homebrew/opt/asdf/libexec/asdf.fish

      fish_add_path ~/.local/bin ~/.emacs.d/bin/ /Applications/Docker.app/Contents/Resources/bin/

      # direnv
      # direnv hook fish | source
      set -xg GOBIN ~/.local/bin
    '';

    plugins = map (name: {
      inherit name;
      src = inputs.nivSources."fish-${name}";
    }) [ "pure" "done" "fzf.fish" "pisces" "z" ];
  };
  home.sessionPath = [ "~/.emacs.d/bin" ];
  home.sessionVariables = { EDITOR = "code -w"; };
  programs.zoxide = import ./zoxide.nix;

  home.file = {
    ".config/fish/completions/aws-vault.fish".source =
      ./completions/aws-vault.fish;
    ".config/fish/completions/gds.fish".source = ./completions/gds.fish;
  };

  fonts.fontconfig.enable = true;
}
