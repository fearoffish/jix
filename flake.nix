{
  inputs = {
    # change tag or commit of nixpkgs for your system
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # change main to a tag o git revision
    mk-darwin-system.url = "github:fearoffish/mk-darwin-system/main";
    # mk-darwin-system.url = "path:/Users/jamievandyke/a/mk-darwin-system";
    mk-darwin-system.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { mk-darwin-system, ... }@inputs:
    let
      userName = "jamievandyke";
      hostName = "fearofair";

      darwinFlake = mk-darwin-system.mkFlake {
        inherit userName hostName inputs;
        flake = ./.;
      };
    in darwinFlake;
}
