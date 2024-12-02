{ lib, pkgs, unstable, ... }:
let
  username = import ../username.nix; # dynamically import the username
in {

  home = {

    packages = with pkgs; [
      #hello
      # docker ### moved to configuration.nix because it requires running on the system level
      (discord.override {
        withVencord = true;
      })
      fastfetch
      firefox
      gedit
      gh
      #gimp
      google-chrome
      mpv
      #python312Packages.pip
      qbittorrent
      #spotify
      #tor-browser
      vscode
      xclip
      zsh
      # unstable
      (unstable.dropbox)
    ];

    inherit username;
    homeDirectory = "/home/${username}";

    # you do not need to change this if you're reading this in the future.
    # don't ever change this after the first build.  don't ask questions.
    stateVersion = "24.05";
    
  }; # home
  
  # modules: zsh. neovim
  imports = [ ../modules/zsh/zsh.nix ../modules/neovim/nvim.nix ../modules/fastfetch/fastfetch.nix ];

  # neovim
  home.file."./.config/nvim/init.lua".source            = ../modules/neovim/init.lua;
  home.file."./.config/nvim/lua/appearance.lua".source  = ../modules/neovim/appearance.lua;
  home.file."./.config/nvim/lua/extras.lua".source      = ../modules/neovim/extras.lua;
  home.file."./.config/nvim/lua/keybindings.lua".source = ../modules/neovim/keybindings.lua;
  home.file."./.config/nvim/lua/lsp.lua".source         = ../modules/neovim/lsp.lua;
  home.file."./.config/nvim/lua/plugins.lua".source     = ../modules/neovim/plugins.lua;

  ## kde
  # dolphin
  home.file."./.config/dolphinrc".source                = ../modules/kde/dolphin/dolphinrc;

}
