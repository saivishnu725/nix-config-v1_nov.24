# flake.nix
# Author:   Sai Vishnu // The Unconcerned Ape
# Email:    me@svnu.me

{
  description = "configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nipkgs.follows = "nixpkgs";
    }; # home-manager
  }; # inputs

  outputs = { nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        theunconcernedape  = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        }; # theunconcernedape
      }; # homeConfigurations
    }; # inputs

}
