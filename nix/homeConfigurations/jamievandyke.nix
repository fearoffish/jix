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
      autoconf # Broadly used tool, no clue what it does
      bash # /bin/bash
      bat
      bottom # istat menus on the cli
      btop # another istat top like monitor
      coreutils
      curl # An old classic
      deadnix # scan for unused nix code
      difftastic
      exa # ls replacement written in Rust
      exercism # exercises to learn and teach programming
      fd # find replacement written in Rust
      ffmpeg
      fontconfig
      fzf # Fuzzy finder
      gcc
      gh # github cli
      git # git maybe?
      git-branchless # git undo and more
      git-extras # useful git extra stuff
      git-lfs
      gitAndTools.delta
      gitui
      gmp
      graphviz
      heroku
      jetbrains-mono
      jq # JSON parsing for the CLI
      lazygit # nice tui for git
      libnotify # for those sweet sweet notifications
      libxml2
      lorri # for shell.nix caching stuff?
      lzma
      multimarkdown
      neovim
      nixfmt
      pandoc
      pinentry_mac # Necessary for GPG
      pkg-config
      pngpaste
      qemu # emulator
      re2c # regex compiler
      ripgrep # grep replacement written in Rust
      ripgrep-all
      rnix-lsp # nix language server
      rustup
      s3cmd # s3 cli
      sd # Fancy sed replacement
      shellcheck # bash linter
      skim # High-powered fuzzy finder written in Rust
      sqlite # sqlite cli
      sumneko-lua-language-server # for syntax in neovim
      tealdeer # tldr for various shell tools
      tmux # cli window manager
      viddy # a modern watch
      wget
      wordnet
      yq # yaml processor like jq
      zellij # a new tmux idea
      zlib
      zoxide

      # Install dmg applications versioned by niv.
      # See `nix develop -c niv show` on the root of your flake.
      #
      # nivApps.FirefoxDevApp
      # nivApps.KeyttyApp
      # nivApps.VimMotionApp
      # nivApps.Iterm2App
    ];
  };
}
