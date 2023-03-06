{ config, lib, pkgs, ... }: {
  programs.ssh = {
    enable = true;
    controlMaster = "auto";
    controlPersist = "10m";
    forwardAgent = true;

    matchBlocks = {
      "*" = {
        extraOptions.IdentityAgent = ''
          "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"'';
      };
      "box.fearof.fish" = {
        user = "jamievandyke";
        hostname = "172.105.133.7";
      };
    };
  };
  # TODO: handle this with nix not manually
  # home.file = {
  #   ".ssh/id_rsa".source = "${config.dots}/ssh/id_rsa";
  #   ".ssh/id_rsa.pub".source = ./id_rsa.pub;
}
