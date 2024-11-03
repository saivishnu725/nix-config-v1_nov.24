{ lib, pkgs, unstable, ... }:
{
  home = {
    packages = with pkgs; [
      #hello
      alacritty
      # unstable.dropbox
      # dropbox
      fastfetch
      gedit
      gimp
      qbittorrent
      tea
      tor-browser
      vscode
      # unstable
      (unstable.dropbox)
    ];

    username = "theunconcernedape";
    homeDirectory = "/home/theunconcernedape";

    # you do not need to change this if you're reading this in the future.
    # don't ever change this after the first build.  don't ask questions.
    stateVersion = "24.05";
  }; # home
}
