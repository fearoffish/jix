{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  home.file."/Library/Preferences/com.googlecode.iterm2.plist".source = ./preferences.plist;
}
