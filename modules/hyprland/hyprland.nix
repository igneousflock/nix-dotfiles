{ den, inputs, ... }:
let
  hyprland = inputs.hyprland;
in
{
  den.aspects.hyprland = {
    includes = [
      den.aspects.kitty

      den.aspects.hyprland.settings
    ];

    nixos =
      { pkgs, ... }:
      {
        # Enable hyprland
        programs.hyprland = {
          enable = true;
          package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
          xwayland.enable = true;
          withUWSM = true;
        };
      };

    homeManager = {
      xdg.portal.config.common.default = "*";

      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        systemd.enable = true;
      };
    };
  };
}
