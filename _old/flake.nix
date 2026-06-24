{
  description = "System and home-manager configuration";

  inputs = {
    # unstable required as 25.11 is missing nvidia driver
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcursor-phinger = {
      url = "github:jappie3/hyprcursor-phinger";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      hyprcursor-phinger,
      hyprland,
      nixos-hardware,
      nixvim,
      zen-browser,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        flock = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [ ./systems/flock/configuration.nix ];
          specialArgs = { inherit hyprland; };
        };
        perch = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./systems/perch/configuration.nix
            nixos-hardware.nixosModules.framework-16-7040-amd
          ];
          specialArgs = { inherit hyprland; };
        };
      };
      homeConfigurations."igneous" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          nixvim.homeModules.nixvim
          hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit zen-browser; };
      };
    };
}
