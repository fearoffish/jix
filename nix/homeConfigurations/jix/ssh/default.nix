{ config, lib, pkgs, ... }: {
  programs.ssh = {
    enable = true;
    controlMaster = "auto";
    controlPersist = "10m";
    forwardAgent = true;

    matchBlocks = {
      "box.fearof.fish" = {
        hostname = "172.105.133.7";
        identityAgent = "~/.1password/agent.sock";
      };
    };
  };
  # TODO: handle this with nix not manually
  # home.file = {
  #   ".ssh/id_rsa".source = "${config.dots}/ssh/id_rsa";
  #   ".ssh/id_rsa.pub".source = ./id_rsa.pub;
}
