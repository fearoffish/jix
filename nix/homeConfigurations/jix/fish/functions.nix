{
  lib,
  inputs,
  ...
}: {
  mg.body = "spc u SPC gg -r \"$PWD\" RET";
  spc.body = "SPC $argv -- -nw";
  vspc.body = "SPC $argv -- -c";
  fish_hybrid_key_bindings.description = "Vi-style bindings that inherit emacs-style bindings in all modes";
  fish_hybrid_key_bindings.body = ''
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
  '';
  rg-nixpkgs.description = "Search on current nixpkgs";
  rg-nixpkgs.body = "rg $argv $HOME/.nix-out/nixpkgs";
  rg-home-manager.description = "Search on current home-manager";
  rg-home-manager.body = "rg $argv $HOME/.nix-out/home-manager";
  rg-nix-darwin.description = "Search on current nix-darwin";
  rg-nix-darwin.body = "rg $argv $HOME/.nix-out/nix-darwin";
  nixos-opt.description = "Open a browser on search.nixos.org for options";
  nixos-opt.body = ''
    open "https://search.nixos.org/options?sort=relevance&query=$argv"'';
  nixos-pkg.description = "Open a browser on search.nixos.org for packages";
  nixos-pkg.body = ''
    open "https://search.nixos.org/packages?sort=relevance&query=$argv"'';
  repology-nixpkgs.description = "Open a browser on search for nixpkgs on repology.org";
  repology-nixpkgs.body = ''
    open "https://repology.org/projects/?inrepo=nix_unstable&search=$argv"'';
}
