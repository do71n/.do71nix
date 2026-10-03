{ config, ... }: let
    nvim_path = "${config.dotfiles.kernel}/editor/nvim/config";
in
{
  programs.neovim = {
    enable = true;
    sideloadInitLua = true;
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink nvim_path;
    recursive = false;
  };
}
