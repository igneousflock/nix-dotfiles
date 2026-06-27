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
      hyprland
      pipewire
      polkit
      sddm
    ];

    # host NixOS configuration
    nixos = {
      imports = [
        ./_hardware-configuration.nix
        inputs.nixos-hardware.nixosModules.framework-16-7040-amd
      ];

      system.stateVersion = "25.05";
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
