{
  config,
  lib,
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d3ca9f25-cb25-47f7-bc22-057ae7c2bad0";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/BD87-0EDD";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/mnt/hdd" = {
    device = "/dev/disk/by-uuid/630cb307-7ae8-40f7-bc7e-651c1edb71b4";
    fsType = "ext4";
  };

  fileSystems."/mnt/bigssd" = {
    device = "/dev/nvme0n1p1";
    fsType = "ext4";
  };

  fileSystems."/home/igneous/hdd" = {
    depends = [ "/mnt/hdd" ];
    device = "/mnt/hdd/igneous";
    fsType = "none";
    options = [
      "bind"
      "nofail"
    ];
  };

  fileSystems."/home/igneous/ssd" = {
    depends = [ "/mnt/hdd" ];
    device = "/mnt/bigssd/igneous";
    fsType = "none";
    options = [
      "bind"
      "nofail"
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/00b900e9-a394-469b-b3e3-7fcc5b1346d5"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
