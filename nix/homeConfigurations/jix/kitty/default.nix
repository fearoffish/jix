{ config, lib, pkgs, inputs, ... }: {
  home.file.".config/kitty/kitty.conf".source = ./kitty.conf;
  home.file.".config/kitty/theme.conf".source = ./theme.conf;
  home.file.".config/kitty/tab_bar.py".source = ./tab_bar.py;
}
