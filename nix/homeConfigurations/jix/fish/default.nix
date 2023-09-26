{ config, lib, pkgs, inputs, ... }: {
  programs.direnv = import ./direnv.nix;
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
      source (dirname (dirname (readlink -f (which asdf))))/share/asdf-vm/asdf.fish

      fish_add_path ~/.local/bin ~/.config/emacs/bin /Applications/Docker.app/Contents/Resources/bin/ /opt/homebrew/opt/grep/libexec/gnubin

      # direnv
      # direnv hook fish | source
      set -xg GOBIN ~/.local/bin
    '';

    plugins = map (name: {
      inherit name;
      src = inputs.nivSources."fish-${name}";
    }) [ "pure" "done" "fzf.fish" "z" ];
  };
  home.sessionPath = [ ];
  home.sessionVariables = {
    EDITOR = "zed -w";
    DOOMDIR = "${config.xdg.configHome}/doom-config";
    DOOMLOCALDIR = "${config.xdg.configHome}/doom-local";
    DOOMPROFILELOADPATH = "${config.xdg.configHome}/doom-local/profiles";
    DOOMPROFILELOADFILE =
      "${config.xdg.configHome}/doom-local/profiles/load.el";
    GITHUB_API_TOKEN = "op://Shared/elh25me6dfg2fbku5ykvh6djny/tokens/gov.uk";
  };

  xdg = {
    enable = true;
    configFile = {
      "emacs" = {
        source = builtins.fetchGit {
          url = "https://github.com/doomemacs/doomemacs";
          ref = "master";
          rev = "07fca786154551f90f36535bfb21f8ca4abd5027";
        };
        onChange = "${pkgs.writeShellScript "doom-change" ''
          export DOOMDIR="${config.home.sessionVariables.DOOMDIR}"
          export DOOMLOCALDIR="${config.home.sessionVariables.DOOMLOCALDIR}"
          export DOOMPROFILELOADPATH="${config.home.sessionVariables.DOOMPROFILELOADPATH}"
          export DOOMPROFILELOADFILE="${config.home.sessionVariables.DOOMPROFILELOADFILE}"
          mkdir -p $''${DOOMPROFILELOADPATH} && chmod +x $''${DOOMPROFILELOADPATH}
          if [ ! -d "$''${DOOMLOCALDIR}" ]; then
            ${config.xdg.configHome}/emacs/bin/doom install --force
          else
            ${config.xdg.configHome}/emacs/bin/doom sync -u
          fi
        ''}";
      };
    };
  };

  programs.zoxide = import ./zoxide.nix;
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    settings = {
      add_newline = false;
      command_timeout = 1000;
    };
  };

  home.file = {
    ".config/fish/completions/aws-vault.fish".source =
      ./completions/aws-vault.fish;
    ".config/fish/completions/gds.fish".source = ./completions/gds.fish;
  };

  fonts.fontconfig.enable = true;
}
