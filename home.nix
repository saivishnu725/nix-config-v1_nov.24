{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      fastfetch
    ];

    username = "svnu";
    homeDirectory = "/home/svnu";

    # you do not need to change this if you're reading this in the future.
    # don't ever change this after the first build.  don't ask questions.
    stateVersion = "24.05";
  }; # home
}
