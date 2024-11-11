{
  # Symlink the Fastfetch configuration file
  home.file.".config/fastfetch/config.jsonc".source = ./config.jsonc;

  # Ensure Fastfetch is installed
  programs.fastfetch = {
    enable = true;
  };
}
