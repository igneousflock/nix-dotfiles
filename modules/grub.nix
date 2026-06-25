{
  den.aspects.grub = {
    nixos = {
      # Use the GRUB 2 boot loader
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.efiInstallAsRemovable = true;
    };
  };
}
