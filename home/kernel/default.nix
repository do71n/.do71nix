{ lib, pkgs, ... }:

{
  home.packages = lib.filter lib.isDerivation (lib.attrValues pkgs.nerd-fonts);

  imports = [
    ./tmux
    ./git.nix
    ./editor/nvim/default.nix
    ./shell/ghostty.nix
    ./shell/zsh/default.nix
    ./shell/starship/default.nix
  ];
}
