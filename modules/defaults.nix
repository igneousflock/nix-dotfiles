{ lib, den, ... }:
{
  den.default.homeManager.home.stateVersion = "26.05";

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];

  den.default.nixos = { pkgs, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.networkmanager.enable = true;

    time.timeZone = "America/Chicago";

    i18n.defaultLocale = "en_US.UTF-8";

    environment.systemPackages = with pkgs; [
      just
      nh
    ];

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
