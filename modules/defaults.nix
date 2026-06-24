{ lib, den, ... }:
{
  den.default.homeManager.home.stateVersion = "26.05";

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default.nixos = { pkgs, ... }: {
    system.stateVersion = "25.05";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.networkmanager.enable = true;

    time.timeZone = "America/Chicago";

    i18n.defaultLocale = "en_US.UTF-8";

    environment.systemPackages = with pkgs; [ nh ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
