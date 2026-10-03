{ lib, config, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    download = "${config.home.homeDirectory}/home/Downloads";
    videos = null;
    music = null;
    pictures = null;
    documents = null;
    desktop = null;
    templates = null;
    publicShare = null;
  };

  home.activation.createCustomDirectories =
  lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p \
      "${config.home.homeDirectory}/home/Dev" \
  '';
}
