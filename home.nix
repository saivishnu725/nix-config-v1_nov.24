{ lib, pkgs, unstable, ... }:
let
  username = import ./username.nix; # dynamically import the username
in {

  home = {

    packages = with pkgs; [
      #hello
      #alacritty
      (discord.override {
        withVencord = true;
      })
      fastfetch
      firefox
      gedit
      gimp
      qbittorrent
      #spotify
      tea
      tor-browser
      vscode
      zsh
      # unstable
      (unstable.dropbox)
    ];

    # username = "myusername";
    # replaced the above with the variable on line 2 and below:
    inherit username;
    homeDirectory = "/home/${username}";

    #programs.zsh.enable = true;

    # you do not need to change this if you're reading this in the future.
    # don't ever change this after the first build.  don't ask questions.
    stateVersion = "24.05";
  }; # home
  
  # shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -laH";
    };
  };
}
