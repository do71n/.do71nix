{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    plugins = with pkgs.tmuxPlugins; [
      {
        plugin = resurrect;

        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'on'
        '';
      }

      {
        plugin = continuum;

        extraConfig = ''
          set -g @continuum-restore 'on'
        '';
      }
    ];

    extraConfig = ''
      # General
      set -g default-terminal "tmux-256color"
      set -as terminal-features ",*:RGB"
      set -g allow-passthrough on

      set -g base-index 1
      setw -g pane-base-index 1
      set -g renumber-windows on
      set -g history-limit 10000
      set -g mouse on
      set -sg escape-time 10
      set -g focus-events on
      set -g extended-keys on

      # Keybindings
      ${builtins.readFile ./config/keybindings.conf}

      # Theme / Styling
      ${builtins.readFile ./config/theme/styling.conf}
    '';
  };
}
