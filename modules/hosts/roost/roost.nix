{ den, ... }: {
  # OVHcloud VPS
  den.hosts.x86_64-linux.roost.users.catbird = { };

  den.aspects.roost = {
    includes = with den.aspects; [
      den.batteries.hostname

      grub
    ];

    settings = {
      grub.device = "dev/sda";
    };

    nixos = {
      imports = [ ./_hardware-configuration.nix ];
      system.stateVersion = "25.11";

      # todo: openssh aspect
      services.openssh.enable = true;
      users.users.root.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINjHG2fiK7Ip1YlPdH/eyT1qIrtOJlHUeMZ13GZvWyGI"
      ];
    };

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
