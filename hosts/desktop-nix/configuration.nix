{
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # ==== gaming ====
    ../../modules/nixos/hardware/nvidia.nix
    ../../modules/nixos/gaming/steam.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "do71netw"; # Define your hostname.

  zramSwap.enable = true;
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Hong_Kong";

  i18n.defaultLocale = "ru_RU.UTF-8";

  programs.zsh.enable = true;

  users.users.dontin = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "input"
      "shutdown"
      "docker"
      "libvirtd"
      "vboxusers"
    ]; # Enable ‘sudo’ for the user.
    initialPassword = "passwd";
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    docker # Containers
    podman # ..
    distrobox # ..
    qemu_kvm # Virtual machines
    qemu_full
    wireguard-tools # VPN
    alsa-tools # legacy ALSA sound card support
    weston # wayland compositor debugger
    evtest # input device tester
    bluetui
    btrfs-progs
  ];

  # docker
  virtualisation.docker.enable = true;
  # Rootless containers and Distrobox
  virtualisation.podman.enable = true;
  # QEMU/KVM with libvirt
  virtualisation.libvirtd = {
    enable = true;

    # NixOS provides the OVMF firmware through QEMU automatically.
    # qemu = {
    #   package = pkgs.qemu_kvm;
    #   swtpm.enable = true;
    #   ovmf.enable = true;
    # };
  };
  # Graphical virtual-machine manager
  programs.virt-manager.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing
  services.printing.enable = true;

  # Power management
  services.power-profiles-daemon.enable = true;

  # Boot splash
  boot.plymouth.enable = true;

  # VirtualBox
  virtualisation.virtualbox.host.enable = true;

  # Firmware
  hardware.firmware = with pkgs; [
    linux-firmware
    sof-firmware
    alsa-firmware
  ];

  # Desktop portals
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };

  # Store passwords, SSH keys, certificates, and application secrets
  services.gnome.gnome-keyring.enable = true;

  # CJK fonts for Chinese, Cantonese, and Japanese text & emoji
  fonts.packages = with pkgs; [
    noto-fonts-cjk-sans
    noto-fonts-emoji-blob-bin
    corefonts
    vista-fonts
    terminus_font
    dejavu_fonts
    roboto
    ubuntu-classic
  ];

  services.vaultwarden = { };
  services.mullvad-vpn.enable = true;

  services.hardware.bolt.enable = true;
  boot.loader.systemd-boot.memtest86.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password\@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
  # };

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "26.05"; # Did you read the comment?
}
