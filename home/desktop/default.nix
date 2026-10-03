{ pkgs, ... }:

{
  home.packages = with pkgs; [
    niri
    noctalia-shell
  ];

  imports = [
    ./noctalia/default.nix
    ./niri/default.nix
    ./xdg/default.nix
  ];

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 40;
    gtk.enable = true;
  };
}
