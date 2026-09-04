{ den, inputs, ... }: {
  flake-file.inputs = {
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # framework 16 laptop
  den.hosts.x86_64-linux.perch.users.igneous = { };

  # host aspect
  den.aspects.perch = {
    includes = with den.aspects; [
      (den.batteries.hostname)
      (den.batteries.tty-autologin "igneous")

      efi

      bluetooth
      fonts
      hyprland
      ly
      pipewire
      polkit
      printer
    ];

    # host NixOS configuration
    nixos = { pkgs, ... }: {
      imports = [
        ./_hardware-configuration.nix
        inputs.nixos-hardware.nixosModules.framework-16-7040-amd
      ];

      system.stateVersion = "25.05";

      environment.systemPackages = with pkgs; [ brightnessctl ];

      services.logind.settings.Login = {
        HandleLidSwitch = "suspend";
        HandlePowerKey = "suspend";
      };
    };

    # host provides default home environment for its users
    provides.to-users.homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fd
          htop
          ripgrep
          unzip
        ];
      };
  };
}
