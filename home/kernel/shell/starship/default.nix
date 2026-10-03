{ config, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    configPath = ".config/starship/starship.toml";
  };

  # xdg.configFile."starship/starship.toml".source = ./theme/starship.toml;
  xdg.configFile."starship/starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.kernel}/shell/starship/theme/starship.toml";
}
