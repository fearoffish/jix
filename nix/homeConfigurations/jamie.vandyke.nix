{ config, lib, pkgs, ... }:
# for configurable home-manager modules see:
# https://github.com/nix-community/home-manager/blob/master/modules/modules.nix
{
  options = {
    dots = lib.mkOption {
      description = "Link to secret stuff";
      type = lib.types.package;
      default = config.lib.file.mkOutOfStoreSymlink /a/dots;
      visible = false;
      readOnly = true;
    };
  };

  imports =
    [ ./jix/git ./jix/ssh ./jix/fish ./jix/gpg ./jix/emacs ./jix/iterm ];

  config = {
    manual.html.enable = false;
    manual.manpages.enable = false;

    home.packages = with pkgs; [
      # direnv # Per-directory environment variables (required by lorri)
      # ncdu # a great large file and folder finder with a tui to help cleanup stuffs
      # niv # Nix dependency management
      alejandra
      any-nix-shell
      asdf-vm
      aws-vault
      autoconf # Broadly used tool, no clue what it does
      bash # /bin/bash
      bat
      bottom # istat menus on the cli
      btop # another istat top like monitor
      cargo
      certstrap
      coreutils
      curl # An old classic
      deadnix # scan for unused nix code
      difftastic
      editorconfig-core-c
      emacs-all-the-icons-fonts
      exa # ls replacement written in Rust
      fd # find replacement written in Rust
      ffmpeg
      fontconfig
      fzf # Fuzzy finder
      gcc
      gh # github cli
      git # git maybe?
      git-lfs
      gitAndTools.delta
      gitui
      gmp
      gnutls
      graphviz
      heroku
      imagemagick
      jq # JSON parsing for the CLI
      lazygit # nice tui for git
      libnotify # for those sweet sweet notifications
      libxml2
      lorri # for shell.nix caching stuff?
      lzma
      multimarkdown
      neovim
      (nerdfonts.override { fonts = [ "VictorMono" "JetBrainsMono" ]; })
      nixfmt
      pandoc
      pass # password manager
      pinentry_mac # Necessary for GPG
      pkg-config
      pngpaste
      # pre-commit # git hooks
      qemu # emulator
      re2c # regex compiler
      (ripgrep.override { withPCRE2 = true; })
      ripgrep-all
      rnix-lsp # nix language server
      rustc
      s3cmd # s3 cli
      sd # Fancy sed replacement
      shellcheck # bash linter
      shfmt
      skim # High-powered fuzzy finder written in Rust
      spruce
      sqlite # sqlite cli
      sumneko-lua-language-server # for syntax in neovim
      tealdeer # tldr for various shell tools
      terraform
      tmux # cli window manager
      viddy # a modern watch
      wget
      wordnet
      yamllint
      yq # yaml processor like jq
      zellij # a new tmux idea
      zlib
      zoxide

      # work stuff
      cloudfoundry-cli
      bosh-cli
      credhub-cli

      # Install dmg applications versioned by niv.
      # See `nix develop -c niv show` on the root of your flake.
      #
      # nivApps.FantasticalApp
      # nivApps.KeyttyApp
      # nivApps.VimMotionApp
      # nivApps.Iterm2App
    ];
  };
}
