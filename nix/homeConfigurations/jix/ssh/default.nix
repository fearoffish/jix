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
      "fearofair.local" = { user = "jamievandyke"; };
      "box" = {
        user = "jamievandyke";
        hostname = "65.109.144.45";
        extraOptions.IdentityFile = ''"~/.ssh/box.pub"'';
        extraOptions.IdentitiesOnly = "yes";
      };
    };
  };
}
