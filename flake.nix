{
  description = "do71nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      homeConfigurations."dt-arch" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./hosts/arch-test/home.nix
        ];
      };
    };
}
