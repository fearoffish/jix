{ lib, pkgs, config, inputs, flake, ... }:
let
  inherit (inputs) nivSources;
  emacsPkg = pkgs.emacs28;
  doomLocalDir = "~/.emacs.d/doom-local";
  doomConf = config.lib.file.mkOutOfStoreSymlink
    "/a/personal/jix/nix/homeConfigurations/jix/emacs/doom.d";
in {
  programs.emacs.enable = true;

  xdg.configFile."doom-config".source = doomConf;
}
