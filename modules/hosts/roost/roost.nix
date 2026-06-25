{ den, ... }: {
  # OVHcloud VPS
  den.hosts.x86_64-linux.roost.users.catbird = { };

  den.aspects.roost = {
    includes = with den.aspects; [
      den.batteries.hostname

      grub
    ];

    nixos = {
      imports = [ ./_hardware-configuration.nix ];
      system.stateVersion = "25.11";

      # Use the GRUB 2 boot loader
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.efiInstallAsRemovable = true;
      # boot.loader.efi.efiSysMountPoint = "/boot/efi";
      # Define on which hard drive you want to install Grub.
      boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

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
