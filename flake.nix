{
  description = "do71nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ==== custom flake that didn't provide up-to-date nixpkgs ====
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents = {
      url = "github:numtide/llm-agents.nix";
    };

    claude-desktop = {
      url = "github:aaddrick/claude-desktop-debian/3755cc45bd6cb4afe0decc736a12ed87577ac324";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      unfreePackages = [
        "claude-code"
        "spotify"
        "steam"
        "steam-unwrapped"
        "discord"
        "discord-unwrapped"
        "obsidian"
        "osu-lazer-bin"
      ];
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) unfreePackages;
      };
    in
    {
      # Arch Machine (Home Manager)
      homeConfigurations."laptop-arch" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          ./hosts/laptop-arch/home.nix
        ];
      };

      # NixOS Machine
      nixosConfigurations.do71nix = nixpkgs.lib.nixosSystem {
        inherit system; # x86_64-linux

        specialArgs = {
          inherit inputs unfreePackages;
        };

        modules = [
          ./hosts/desktop-nix/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = {
                inherit inputs;
              };

              users.dontin = import ./hosts/desktop-nix/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };

    };
}
