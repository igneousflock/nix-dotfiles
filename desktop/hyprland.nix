{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    systemd.enable = true;
    configType = "hyprlang";

    settings = {
      # monitor settings https://wiki.hypr.land/0.54.0/Configuring/Monitors/
      monitor = [ "eDP-1, preferred, auto, auto, cm, auto" ];

      # keywords https://wiki.hypr.land/0.54.0/Configuring/Keywords/
      "$terminal" = "kitty";
      "$browser " = "zen";
      "$menu " = "hyprlauncher";
      "$mainMod" = "SUPER";

      # autostart
      exec-once = [
        "1password --silent &"
        "hyprpaper &"
      ];

      # environment variables https://wiki.hypr.land/0.54.0/Configuring/Environment-variables/
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,phinger-cursors-dark"
      ];

      # look and feel, https://wiki.hypr.land/0.54.0/Configuring/Variables/#general
      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 3;

        "col.active_border " = "rgba(800080aa)";
        "col.inactive_border " = "rgba(a3a3a3ee)";
      };

      resize_on_border = false;

      allow_tearing = false;

      # https://wiki.hypr.land/0.54.0/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;
        rounding_power = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        # https://wiki.hypr.land/0.54.0/Configuring/Variables/#blur
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        # https://wiki.hypr.land/0.54.0/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      # https://wiki.hypr.land/0.54.0/Configuring/Variables/#animations
      animations = {
        enabled = true;

        bezier = [
          #NAME,           X0,   Y0,   X1,   Y1
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        # defaults, https://wiki.hypr.land/0.54.0/Configuring/Animations/
        animation = [
          #NAME,          ONOFF, SPEED, CURVE,        [STYLE]
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      # https://wiki.hypr.land/0.54.0/Configuring/Dwindle-Layout/
      dwindle = {
        preserve_split = true;
      };

      # https://wiki.hypr.land/0.54.0/Configuring/Master-Layout/
      master = {
        new_status = "master";
      };

      # https://wiki.hypr.land/0.54.0/Configuring/Variables/#misc
      # https://wiki.hypr.land/0.54.0/Configuring/Variables/#misc
      misc = {
        # disable default wallpaper
        force_default_wallpaper = 0;
        # disable logo rendering
        disable_hyprland_logo = true;
        # disable annoying random background text
        disable_splash_rendering = true;
      };

      # https://wiki.hypr.land/0.54.0/Configuring/Variables/#misc
      input = {
        kb_layout = "us";
        follow_mouse = 0;
      };

      # Don't scale xwayland apps, fix for discord & steam
      xwayland.force_zero_scaling = true;

      # keybindings, https://wiki.hypr.land/0.54.0/Configuring/Binds/
      bindu = [
        "$mainMod, return, exec, $terminal"
      ];
      bind = [
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, F, exec, $browser"
        "$mainMod, TAB, focuscurrentorlast"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Move windows
        "$mainMod SHIFT, H, movewindow, l"
        "$mainMod SHIFT, L, movewindow, r"
        "$mainMod SHIFT, K, movewindow, u"
        "$mainMod SHIFT, J, movewindow, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Switch to app-specific workspaces
        "$mainMod , D, workspace, discord"
        "$mainMod SHIFT, D, movetoworkspace, discord"
        "$mainMod , S, workspace, steam"
        "$mainMod SHIFT, S, movetoworkspace, steam"
        "$mainMod , P, workspace, spotify"
        "$mainMod SHIFT, P, movetoworkspace, spotify"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_up, workspace, e+1"
        "$mainMod, mouse_down, workspace, e-1"

        # Enter resize mode
        "$mainMod SHIFT, R, submap, resize"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        {
          # Ignore maximize requests from all apps. You'll probably like this.
          name = "suppress-maximize-events";
          "match:class" = ".*";
          suppress_event = "maximize";
        }
        {
          # Fix some dragging issues with XWayland
          name = "fix-xwayland-drags";
          "match:class" = "^$";
          "match:title" = "^$";
          "match:xwayland" = true;
          "match:float" = true;
          "match:fullscreen" = false;
          "match:pin" = false;
          no_focus = true;
        }
        {
          name = "discord";
          "match:class" = "discord";
          workspace = "name:discord";
        }
        {
          name = "steam";
          "match:class" = "steam";
          workspace = "name:steam";
        }
        {
          name = "spotify";
          "match:class" = "Spotify";
          workspace = "name:spotify";
        }
      ];
    };

    # submaps
    submaps = {
      resize = {
        settings = {
          binde = [
            # hold vim keys to expand or shrink window
            ", h, resizeactive, -10 0"
            ", l, resizeactive, 10 0"
            ", k, resizeactive, 0 -10"
            ", j, resizeactive, 0 10"

            # reset with any key
            ", catchall, submap, reset"
            ", escape, submap, reset"
          ];
        };
      };
    };
  };
}
