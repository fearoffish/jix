{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  programs.gpg = {
    enable = true;
    settings.use-agent = true;
    publicKeys = [{source = ./pubkeys.txt;}];
  };
  home.file.".gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';
}
