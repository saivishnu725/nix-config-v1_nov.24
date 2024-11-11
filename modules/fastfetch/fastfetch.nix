{
  # Symlink the Fastfetch configuration file
  home.file.".config/fastfetch/config.json".source = ./modules/fastfetch/config.json;

  # Ensure Fastfetch is installed
  programs.fastfetch = {
    enable = true;
  };
}
