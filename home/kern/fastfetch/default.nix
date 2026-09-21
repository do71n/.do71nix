{ ... }:

{
  programs.fastfetch.enable = true;

  home.file.".config/fastfetch/config.jsonc".source = ./config.jsonc;

  home.file.".config/fastfetch/images/hollow.png".source = ./images/hollow.png;

}
