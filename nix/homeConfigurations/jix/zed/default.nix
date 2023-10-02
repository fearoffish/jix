{ config, lib, pkgs, inputs, ... }: {
  home.file.".config/zed/settings.json".source = ./configs/settings.json;
  home.file.".config/zed/keymap.json".source = ./configs/keymap.json;
}
