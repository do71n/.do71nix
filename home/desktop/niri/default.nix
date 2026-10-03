{ config, ... }:

{
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.desktop}/niri/config";
    recursive = false;
  };
}
