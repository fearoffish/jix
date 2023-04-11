{
  config,
  lib,
  pkgs,
  ...
}: {
  home.file = {
    ".ssh/id_ed25519.pub".source = ./id_ed25519.pub;
  };

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
      "fearofair.local" = {user = "jamievandyke";};
      "pve" = {
        user = "root";
        hostname = "10.0.0.101";
        extraOptions = {
          IdentitiesOnly = "yes";
          IdentityFile = "~/.ssh/ed_25519.pub";
        };
      };
      "plex" = {
        user = "root";
        hostname = "10.0.0.12";
        extraOptions = {
          IdentitiesOnly = "yes";
          IdentityFile = "~/.ssh/id_ed25519.pub";
        };
      };
      "sab" = {
        user = "root";
        hostname = "10.0.0.13";
        extraOptions = {
          IdentitiesOnly = "yes";
          IdentityFile = "~/.ssh/id_ed25519.pub";
        };
      };
      "sonarr" = {
        user = "root";
        hostname = "10.0.0.14";
        extraOptions = {
          IdentitiesOnly = "yes";
          IdentityFile = "~/.ssh/id_ed25519.pub";
        };
      };
      "radarr" = {
        user = "root";
        hostname = "10.0.0.15";
        extraOptions = {
          IdentitiesOnly = "yes";
          IdentityFile = "~/.ssh/id_ed25519.pub";
        };
      };
      "jelly" = {
        user = "root";
        hostname = "10.0.0.11";
        extraOptions = {
          IdentitiesOnly = "yes";
          IdentityFile = "~/.ssh/id_ed25519.pub";
        };
      };
    };
  };
}
