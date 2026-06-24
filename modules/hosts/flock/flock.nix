{ den, ... }: {
  # host aspect
  den.aspects.flock = {
    includes = with den.aspects; [
      (den.batteries.hostname)
      (den.batteries.tty-autologin "igneous")

      hyprland
      nvidia
      pipewire
      polkit
      sddm
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
