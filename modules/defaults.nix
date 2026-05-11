{ lib, ... }:
let
  stateVersion = "25.05";
in
{
  den.default.nixos = {
    system.stateVersion = stateVersion;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "America/Chicago";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

  };
  den.default.homeManager.home.stateVersion = stateVersion;

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
