{ den, inputs, ... }:
{
  flake-file.inputs = {
    hyprland.url = "github:hyprwm/Hyprland";
  };

  den.quirks.autostart = {
    description = "Applications to start automatically in the desktop environment";
  };

  den.aspects.hyprland = {
    includes = with den.aspects; [
      hyprland.hyprpaper
      hyprland.waybar
    ];

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

      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
    };

    homeManager =
      {
        autostart,
        lib,
        pkgs,
        ...
      }:
      {
        imports = [
          ./_hyprland-lua.nix
        ];

        home.packages = with pkgs; [ grimblast ];

        xdg.portal.config.common.default = "*";

        wayland.windowManager.hyprland = {
          enable = true;
          package = null;
          systemd.enable = true;
          configType = "lua";

          extraLuaFiles = {
            "animations" = {
              content = ./hyprland-animations.lua;
              autoLoad = true;
            };
            "binds" = {
              content = ./hyprland-binds.lua;
              autoLoad = true;
            };
          };

          extraConfig =
            let
              all_autostart = lib.concatMap (a: a.exec-once or [ ]) autostart;
              cmds = lib.strings.concatMapStringsSep "\n" (c: "hl.exec_cmd(\"${c}\")") all_autostart;
            in
            ''
              hl.on("hyprland.start", function()
                ${cmds}
              end)
            '';
        };

        services.hyprlauncher = {
          enable = true;
          settings = {
            finders.desktop_icons = true;
            general.grab_focus = true;
          };
        };
      };
  };
}
