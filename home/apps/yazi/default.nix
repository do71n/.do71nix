{ ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = builtins.fromTOML (builtins.readFile ./config/yazi.toml);

    keymap = builtins.fromTOML (builtins.readFile ./config/keymap.toml);

    theme = builtins.fromTOML (builtins.readFile ./config/theme.toml);

    flavors = {
      "catppuccin-mocha" = ./config/flavors/catppuccin-mocha.yazi;
    };
  };

  # Yazi's package manager configuration
  xdg.configFile."yazi/package.toml".source = ./config/package.toml;
}
