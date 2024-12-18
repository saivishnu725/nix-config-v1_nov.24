# flake.nix
# Author:   Sai Vishnu // The Unconcerned Ape
# Email:    saivishnu725@gmail.com

{
  description = "configs";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
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
      username = [ ./username.nix ];
    in {
      homeConfigurations = {
        
        # desktop
        desktop  = home-manager.lib.homeManagerConfiguration {
          inherit pkgs; # unstable;
          modules = [ ./hosts/desktop.nix ];
          extraSpecialArgs = {
            unstable = unstable;
          };
        }; # desktop

        # server
        server = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./hosts/server.nix ];
          extraSpecialArgs = {
            unstable = unstable;
          };
        }; # server

      }; # homeConfigurations
    }; # in
   
}
