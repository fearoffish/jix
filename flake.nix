{
  inputs = {
    # change tag or commit of nixpkgs for your system
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # change main to a tag o git revision
    # mk-darwin-system.url = "github:vic/mk-darwin-system/main";
    mk-darwin-system.url = "path:/a/mk-darwin-system";
    mk-darwin-system.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {mk-darwin-system, ...} @ inputs: let
    userName = "C5343288";
    hostName = "K9XQJHW7QC";

    darwinFlake = mk-darwin-system.mkFlake {
      inherit userName hostName inputs;
      flake = ./.;
    };
  in
    darwinFlake;
}
