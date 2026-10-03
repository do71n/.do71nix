{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # cli
    bat
    btop
    eza
    fd
    fzf
    jq
    ripgrep
    zoxide

    # Wayland utilities
    libnotify
    pavucontrol # per app audio routing
    wl-clipboard
    xwayland-satellite

    # Desktop utilities
    discord
    freecad
    gimp
    krita
    obs-studio
    neovide
    spotify
    steam
    thunderbird
    gnome-disk-utility
    nautilus
    # nemo
    obsidian
    osu-lazer-bin
    wayscriber
    zennotes-desktop
    vial
    tailcat

    # File
    imagemagick
    zathura
    zathuraPkgs.zathura_pdf_mupdf
    texliveFull

    # Development and terminal tools
    arduino-cli
    cppcheck
    claude-code
    distrobox
    lazydocker
    lazygit
    luarocks
    rustup
    tree-sitter
    uv
    zig

    # VPN & Security
    wireguard-tools
    mullvad-vpn
    proton-vpn-cli
    proton-vpn
    protonmail-bridge
    protonmail-bridge-gui
    bitwarden-cli
    bitwarden-desktop
  ];

  # ~/.local/share/applications
  xdg.desktopEntries.Vial = {
    name = "Vial";
    exec = "env QT_SCALE_FACTOR=1.2 DESKTOPINTEGRATION=false ${pkgs.vial}/bin/vial";
    icon = "Vial";
    terminal = false;
    categories = [ "Utility" ];
  };
}
