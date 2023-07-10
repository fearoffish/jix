{ config, lib, pkgs, inputs, ... }: {
  home.file.".config/iterm/com.googlecode.iterm2.plist".source =
    ./com.googlecode.iterm2.plist;
}
