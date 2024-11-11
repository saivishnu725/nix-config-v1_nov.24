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
      gh
      #gimp
      qbittorrent
      #spotify
      #tor-browser
      vscode
      xclip
      zsh
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
  
  # shell
  #programs.zsh = {
  #  enable = true;
  #  enableCompletion = true;
  #  autosuggestion.enable = true;
  #  syntaxHighlighting.enable = true;

  #  shellAliases = {
  #    ll = "ls -l";
  #    la = "ls -laH";
  #  };
  #};
  
  # modules: zsh. neovim
  imports = [ ./modules/zsh/zsh.nix ./modules/neovim/nvim.nix ];

  # neovim
  home.file."./.config/nvim/init.lua".source = ./modules/neovim/init.lua;

}
