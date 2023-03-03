{ config, lib, pkgs, ... }:
# for configurable nixos modules see (note that many of them might be linux-only):
# https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/module-list.nix
#
# for configurable nix-darwin modules see
# https://github.com/LnL7/nix-darwin/blob/master/modules/module-list.nix
{
  environment.systemPackages = with pkgs; [ nixVersions.stable ];
  documentation.enable = false;

  # nixpkgs.overlays = [
  #   (import ./../overlays/unison.nix inputs.nivSources)
  # ];

  system = {
    defaults = {
      dock = { autohide = true; };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };

      NSGlobalDomain = {
        "com.apple.trackpad.scaling" = 2.0;
        "com.apple.mouse.tapBehavior" = 1;
        "com.apple.sound.beep.feedback" = 1;
        InitialKeyRepeat = 10;
        KeyRepeat = 1;
        ApplePressAndHoldEnabled = false;
        AppleFontSmoothing = 2;

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      #CustomUserPreferences = {};
      #CustomSystemPreferences = {};
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  homebrew = {
    enable = true;

    casks = [
      "1password"
      "1password-cli"
      "brave-browser"
      "caffeine"
      "docker"
      "font-iosevka-aile"
      "font-iosevka-nerd-font"
      "font-fontawesome"
      "font-jetbrains-mono"
      "font-material-design-icons-webfont"
      "gpg-suite"
      "istat-menus"
      "iterm2"
      "kaleidoscope"
      "keybase"
      "keyboard-maestro"
      "linearmouse"
      "lunar"
      "raycast"
      "setapp"
      "sigmaos"
      "slack"
      "snapmaker-luban"
      "sublime-text"
      "visual-studio-code"
      "zoom"
    ];
    brews = [ "asdf" ];
    taps = [ "homebrew/cask-fonts" "alphagov/gds" ];
  };

  # environment = {
  # };
}
