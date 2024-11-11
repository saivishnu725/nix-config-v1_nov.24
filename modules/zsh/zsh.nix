{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "dst";  # Set your preferred theme

    # Load Zsh plugins
    plugins = [
      #"git"
    ];
   };

   # fastfetch
   initExtra = "$HOME/.nix-profile/bin/fastfetch";

   # Set environment variables
   sessionVariables = {
     ZSH_CUSTOM = "$HOME/.oh-my-zsh/custom";
   };
  };
  # Import aliases and functions
  imports = [ ./aliases.nix ];
}
