{ lib, config, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    download = "${config.home.homeDirectory}/base/Downloads";
    pictures = "${config.home.homeDirectory}/base/Pictures";
    videos = null;
    music = null;
    documents = null;
    desktop = null;
    templates = null;
    publicShare = null;
  };

  home.file = {
    "base/dev/.track".text = "";
  };
}
