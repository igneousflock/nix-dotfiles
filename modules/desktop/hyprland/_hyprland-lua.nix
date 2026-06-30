{
  wayland.windowManager.hyprland = {
    settings = {
      # https://wiki.hypr.land/Configuring/Basics/Monitors/
      monitor = [
        {
          output = "HDMI-A-2";
          mode = "2560x1440@144.00Hz";
          position = "auto";
          scale = 1;
        }
      ];

      config = {
        # https://wiki.hypr.land/Configuring/Basics/Variables/#general
        general = {
          gaps_in = 3;
          gaps_out = 3;
          border_size = 3;

          "col.active_border" = "rgba(800080aa)";
          "col.inactive_border" = "rgba(a3a3a3ee)";

          resize_on_border = false;
          allow_tearing = false;
        };

        # https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
        decoration = {
          rounding = 10;
          rounding_power = 10;

          active_opacity = 1.0;
          inactive_opacity = 1.0;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
          };
        };

        # https://wiki.hypr.land/Configuring/Basics/Variables/#input
        input = {
          kb_layout = "us";
          numlock_by_default = true;
          accel_profile = "flat";
          follow_mouse = 0;
        };

        # https://wiki.hypr.land/Configuring/Basics/Variables/#misc
        misc = {
          # disable annoying logos and text
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          force_default_wallpaper = 0;
          mouse_move_focuses_monitor = false;
          background_color = "0xFFFFFF";
        };

        # https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
        dwindle = {
          preserve_split = true;
        };

        # https://wiki.hypr.land/Configuring/Basics/Variables/#xwayland
        xwayland = {
          enabled = true;
          force_zero_scaling = true;
        };
      };

      window_rule = [
        {
          name = "suppress-maximize-events";
          match.class = ".*";
          suppress_event = "maximize";
        }
        {
          # Fix some dragging issues with XWayland
          name = "fix-xwayland-drags";
          match = {
            class = "^$";
            title = "^$";
            xwayland = true;
            float = true;
            fullscreen = false;
            pin = false;
          };
          no_focus = true;
        }
        {
          name = "discord";
          match.class = "discord";
          workspace = "name:discord";
        }
        {
          name = "steam";
          match.class = "steam";
          workspace = "name:steam";
        }
        {
          name = "spotify";
          match.class = "Spotify";
          workspace = "name:spotify";
        }
      ];
    };
  };
}
