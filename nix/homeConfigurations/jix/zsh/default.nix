{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home.sessionPath = [
    "$HOME/.local/bin"
  ];
  programs.zsh = {
    enable = true;
    initExtra = ''
      export ASDF_DIR=/opt/homebrew/opt/asdf/libexec
      eval "$(/opt/homebrew/bin/brew shellenv)"
      . /opt/homebrew/opt/asdf/libexec/asdf.sh

      . ~/.github_token
      if [ -z "$HOMEBREW_GITHUB_API_TOKEN" ]; then echo "HOMEBREW_GITHUB_API_TOKEN is not set"; fi

      # Load the custom .*-pass I have
      if (( $+commands[pass] )); then
          for i in ''${HOME}/.*-pass; do
              source_file="''${i}/.load.zsh"
              if [[ -f "''${source_file}" ]]; then
                  if [[ "''${source_file}" -nt "''${source_file}.zwc" ]] || [[ ! -f "''${source_file}.zwc" ]]; then
                      zcompile "''${source_file}"
                  fi
                  source "''${source_file}"
              fi
          done
      fi
    '';
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-syntax-highlighting";}
        {name = "zsh-users/zsh-completions";}
        {
          name = "plugins/aliases";
          tags = [from:oh-my-zsh];
        }
        {
          name = "plugins/asdf";
          tags = [from:oh-my-zsh];
        }
        {
          name = "plugins/brew";
          tags = [from:oh-my-zsh];
        }
        {
          name = "norman-abramovitz/cf-zsh-autocomplete-plugin";
          tags = [rename-to:cf];
        }
      ];
    };
    shellAliases = import ./aliases.nix;
  };
  programs.starship = import ../starship;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.exa = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  # imports
  programs.zoxide = import ./zoxide.nix;
}
