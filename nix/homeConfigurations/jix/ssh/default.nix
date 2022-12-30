{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.ssh = {
    enable = true;
    controlMaster = "auto";
    controlPersist = "10m";
    forwardAgent = true;
  };
  # TODO: handle this with nix not manually
  # home.file = {
  #   ".ssh/id_rsa".source = "${config.dots}/ssh/id_rsa";
  #   ".ssh/id_rsa.pub".source = ./id_rsa.pub;
  # };
}
