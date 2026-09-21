{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user.name = "howardk";
      user.email = "62504060+do71n@users.noreply.github.com";

      init.defaultBranch = "main";

      core.editor = "nvim";
      core.excludesfile = "~/.gitignore_global";

      windows.appendAtomically = false;
      http.schannelCheckRevoke = false;

      pull.rebase = true;
    };
  };
}
