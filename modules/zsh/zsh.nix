{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    # plugins = [
      # {
        # will source zsh-autosuggestions.plugin.zsh
      #   name = "zsh-autosuggestions";
      #   src = pkgs.fetchFromGitHub {
      #     owner = "zsh-users";
      #     repo = "zsh-autosuggestions";
      #     rev = "v0.7.0";
      #     sha256 = "169vvn1nrdrrcwyyb8lmzff9pza887k55rl7gxgvgxkd5apvhs5d";
      #   };
      # }
     # {
     #   name = "zsh-autocomplete";
     #   src = pkgs.fetchFromGitHub {
     #     owner = "marlonrichert";
     #     repo = "zsh-autocomplete";
     #     rev = "2024-09-04";
     #     #sha256 = "762afacbf227ecd173e899d10a28a478b4c84a3f";
     #   };
     # }
    # ];    
    oh-my-zsh = {
      enable = true;
      theme = "dst";  # Set your preferred theme
    #};

    # Load Zsh plugins
    plugins = [
      "git"
      #"zsh-users/zsh-autosuggestions"
      #"ubuntu"
      #"flutter"
    ];
   };

    # Set environment variables
    sessionVariables = {
      ZSH_CUSTOM = "$HOME/.oh-my-zsh/custom";
    };
  };
  # Import aliases and functions
  imports = [ ./aliases.nix ];
}
