{ den, ... }: {
  # host aspect
  den.aspects.perch = {
    includes = with den.aspects; [
      (den.batteries.hostname)
      (den.batteries.tty-autologin "igneous")

      bluetooth
      hyprland
      pipewire
      polkit
      sddm
    ];

    # host NixOS configuration
    nixos = {
      imports = [ ./_hardware-configuration.nix ];
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
