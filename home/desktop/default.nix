{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia/default.nix
    ./niri/default.nix
    ./xdg/default.nix
  ];

  home.packages = with pkgs; [
    niri
  ];

  programs.noctalia = {
    enable = true;
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Amber";
    size = 40;
    gtk.enable = true;
  };
}
