# flake.nix
# Author:   Sai Vishnu // The Unconcerned Ape
# Email:    me@svnu.me

{
  description = "configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nipkgs.follows = "nixpkgs";
    }; # home-manager
  }; # inputs

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        inherit system;
        config.allowUnfree = true;
      };
      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations = {
        theunconcernedape  = home-manager.lib.homeManagerConfiguration {
          inherit pkgs; # unstable;
          modules = [ ./home.nix ];
          extraSpecialArgs = {
            unstable = unstable;
          };
        }; # theunconcernedape
      }; # homeConfigurations
    }; # in
   
}
