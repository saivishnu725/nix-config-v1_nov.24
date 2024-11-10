{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "dst";  # Set your preferred theme
    };

    # Load Zsh plugins
    plugins = [
      "git"
      "zsh-autosuggestions"
      "zsh-syntax-highlighting"
      "gradle-completion"
      "ubuntu"
      "flutter"
    ];

    # Set environment variables
    sessionVariables = {
      ZSH_CUSTOM = "$HOME/.oh-my-zsh/custom";
    };
  };
  # Import aliases and functions
  imports = [ ./aliases.nix ];
}
