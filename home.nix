{ lib, pkgs, unstable, ... }: let
  username = "theunconcernedape";
in {
  home = {
    packages = with pkgs; [
      #hello
      alacritty
      fastfetch
      gedit
      gimp
      qbittorrent
      spotify
      tea
      tor-browser
      vscode
      # unstable
      (unstable.dropbox)
    ];

    # username = "myusername";
    # replaced the above with the variable on line 2 and below:
    inherit username;
    homeDirectory = "/home/${username}";

    # you do not need to change this if you're reading this in the future.
    # don't ever change this after the first build.  don't ask questions.
    stateVersion = "24.05";
  }; # home
}
