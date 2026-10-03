{ config, lib, ... }:

{
  options.dotfiles = {
    root = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.do71nix";
    };

    home = lib.mkOption {
      type = lib.types.str;
      default = "${config.dotfiles.root}/home";
    };

    kernel = lib.mkOption {
      type = lib.types.str;
      default = "${config.dotfiles.home}/kernel";
    };

    apps = lib.mkOption {
      type = lib.types.str;
      default = "${config.dotfiles.home}/apps";
    };

    desktop = lib.mkOption {
      type = lib.types.str;
      default = "${config.dotfiles.home}/desktop";
    };
  };

  config.home.sessionVariables.DOTFILES_ROOT = config.dotfiles.root; # will be used in zsh alias for dotfiles
}
