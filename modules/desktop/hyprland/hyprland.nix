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

      dunst
      wofi
    ];

    nixos = { system, ... }: {
      programs.hyprland = {
        enable = true;
        package = inputs.hyprland.packages.${system}.hyprland;
        portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
        xwayland.enable = true;
        withUWSM = false;
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

        home.packages = with pkgs; [
          grimblast
          hyprshutdown
          wofi-emoji
        ];

        wayland.windowManager.hyprland = {
          enable = true;
          package = null;
          portalPackage = null;
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

        programs.hyprlock = {
          enable = true;
          settings = {
            input-field = [
              {
                dots_center = true;
                fade_on_empty = false;
              }
            ];
          };
        };
      };
  };
}
