{ den, inputs, ... }:
{
  flake-file.inputs = {
    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  den.aspects.hyprland = {
    includes = with den.aspects; [ hyprland.waybar ];

    nixos = { pkgs, ... }: {
      programs.hyprland =
        let
          hyprland = inputs.hyprland;
        in
        {
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
      imports = [ ./_settings.nix ];

      xdg.portal.config.common.default = "*";

      wayland.windowManager.hyprland = {
        enable = true;
        package = null;
        systemd.enable = true;
        configType = "hyprlang";
      };
    };
  };
}
