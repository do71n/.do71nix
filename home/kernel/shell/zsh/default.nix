{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    dotDir = "${config.xdg.configHome}/zsh";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}/share/zsh/plugins/zsh-autosuggestions";
      }
      {
        name = "zsh-completions";
        src = "${pkgs.zsh-completions}/share/zsh/plugins/zsh-completions";
      }
      {
        name = "zsh-history-substring-search";
        src = "${pkgs.zsh-history-substring-search}/share/zsh/plugins/zsh-history-substring-search";
      }
      {
        name = "zsh-vi-mode";
        src = "${pkgs.zsh-vi-mode}/share/zsh/plugins/zsh-vi-mode";
      }
      {
        name = "fast-syntax-highlighting";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/plugins/fast-syntax-highlighting";
      }
    ];

    setOptions = [
      "AUTO_CD"
      "NO_BEEP"
      "NUMERIC_GLOB_SORT"
    ];

    history = {
      path = "${config.xdg.stateHome}/zsh/history";
      size = 100000;
      save = 100000;
      append = true;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      findNoDups = true;
    };

    envExtra = ''
      export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$HOST-$ZSH_VERSION"
      export DISABLE_AUTO_UPDATE=true

      if [[ -n "$SSH_CONNECTION" ]]; then
        export EDITOR="vim"
        export VISUAL="vim"
      else
        export EDITOR="nvim"
        export VISUAL="nvim"
      fi

      [[ -t 0 ]] && export GPG_TTY="$(tty)"
    '';

    initContent = ''
      # Enable interactive completion meun selection (tab)
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # Treat / as a word boundary for Zsh word motions
      WORDCHARS="''${WORDCHARS//\//}"

      # Load fzf completion system
      if (( $+commands[fzf] )); then
        eval "$(fzf --zsh)"
      fi

      # ==== Modular Configs (source) ====
      ZSH_CONFIG="$ZDOTDIR/config"

      source "$ZSH_CONFIG/options.zsh"
      source "$ZSH_CONFIG/fzf.zsh"
      source "$ZSH_CONFIG/bindings.zsh"
      source "$ZSH_CONFIG/aliases.zsh"
    '';

    profileExtra = builtins.readFile ./zsh/.zprofile;
  };

  # xdg.configFile."zsh/config".source = ./zsh/config;
  xdg.configFile."zsh/config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.kernel}/shell/zsh/zsh/config";

    recursive = false;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.local/scripts"
    "$HOME/.cargo/bin"
  ];

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    MANPAGER = "bat -l man -p";
    VIRTUAL_ENV_DISABLE_PROMPT = "1";
  };
}
