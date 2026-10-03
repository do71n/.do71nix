{ config, ... }:
let
  noctalia = path: config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.desktop}/noctalia/config/${path}";
in
{
  xdg.configFile."noctalia/config.toml".source = noctalia "config.toml";
  xdg.configFile."noctalia/plugin/vpn.toml".source = noctalia "plugin/vpn.toml";
  xdg.stateFile."noctalia/settings.toml".source = noctalia "settings.toml";
}
