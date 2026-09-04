{ den, ... }: {
  # desktop pc
  den.hosts.x86_64-linux.flock.users.igneous = { };

  # host aspect
  den.aspects.flock = {
    includes = with den.aspects; [
      (den.batteries.hostname)
      (den.batteries.tty-autologin "igneous")

      efi

      autologin
      bluetooth
      fonts
      hyprland
      ly
      nvidia
      pipewire
      polkit
      printer
      tranquil.local-dev
    ];

    # host NixOS configuration
    nixos = {
      imports = [ ./_hardware-configuration.nix ];
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
