{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    #configure = {
    #  customRC = ./init.lua;
    #};
    extraConfig = builtins.readFile ./init.lua;
 };
}

