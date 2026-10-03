{ lib, config, ... }:

{
  home.activation.createVirtualDirectory =
  lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p \
      "${config.home.homeDirectory}/virtual"
  '';

  imports = [
    ./paths.nix
    ./apps
    ./fcitx5
    ./kernel/default.nix
    ./desktop/default.nix
  ];
}
