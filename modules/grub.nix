{ lib, ... }: {
  # Use the GRUB 2 boot loader
  den.aspects.grub = {
    settings = {
      device = lib.mkOption {
        type = lib.types.str;
        description = "The drive on which to install Grub";
      };
    };

    nixos = { host, ... }: {
      boot.loader.grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = host.settings.grub.device;
      };
    };
  };
}
