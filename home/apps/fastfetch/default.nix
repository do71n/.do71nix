{ config, ... }:

{
  programs.fastfetch.enable = true;

  # home.file.".config/fastfetch/config.jsonc".source = ./config.jsonc;
  # home.file.".config/fastfetch/images/hollow.png".source = ./images/hollow.png;

  home.file.".config/fastfetch/config.jsonc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.apps}/fastfetch/config.jsonc";

  home.file.".config/fastfetch/images/hollow.png".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.apps}/fastfetch/images/hollow.png";

}
