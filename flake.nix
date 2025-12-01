{
  description = "Home Manager configuration of igneous";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      hyprcursor-phinger,
      hyprland,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      op-shell = inputs._1password-shell-plugins;
    in
    {
      nixosConfigurations = {
        flock = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
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
          op-shell.hmModules.default
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
