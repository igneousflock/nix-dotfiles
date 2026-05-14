{ den, inputs, ... }:
let
  hyprland = inputs.hyprland;
in
{
  den.aspects.hyprland = {
    includes = [
      den.aspects.kitty
      den.aspects.zen
      den.aspects.firefox

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
        # Use cachix
        nix.settings = {
          substituters = [ "https://hyprland.cachix.org" ];
          trusted-substituters = [ "https://hyprland.cachix.org" ];
          trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
        };
      };

    homeManager = {
      xdg.portal.config.common.default = "*";

      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        systemd.enable = true;
        # TODO: migrate to lua (remove line, see warning)
        configType = "hyprlang";
      };
    };
  };
}
