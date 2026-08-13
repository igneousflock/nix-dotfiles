{
  den.aspects.hyprland.waybar = {
    homeManager = {
      programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings.main = {
          height = 34;
          spacing = 10;

          modules-left = [
            "hyprland/workspaces"
            "hyprland/submap"
            "hyprland/window"
          ];
          modules-right = [
            "keyboard-state"
            "pulseaudio"
            "network"
            "cpu"
            "memory"
            "temperature"
            "battery"
            "clock"
            "tray"
            "custom/power"
          ];

          "hyprland/window" = {
            rewrite = {
              "(.*) — (Zen Browser|Mozilla Firefox)" = "🌎 $1";
              "(.*) - Discord" = "💬 $1";
            };
            separate-outputs = true;
          };

          keyboard-state = {
            numlock = true;
            capslock = true;
            format = {
              capslock = "C {icon}";
              numlock = "{icon} N";
            };
            format-icons = {
              locked = " ";
              unlocked = " ";
            };
          };

          pulseaudio = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = " ";
            format-icons = {
              headphone = "";
              default = [
                " "
                " "
                " "
              ];
            };
            on-click = "pavucontrol";
          };

          network = {
            format-wifi = "{essid} ({signalStrength}%)  ";
            format-ethernet = "{ipaddr}/{cidr} 🔌";
            tooltip-format = "{ifname} via {gwaddr} ";
            format-linked = "{ifname} (No IP) ";
            format-disconnected = "Disconnected ⚠";
            format-alt = "{ifname}: {ipaddr}/{cidr}";
          };

          cpu = {
            format = "{usage}%  ";
            tooltip = true;
          };

          memory = {
            format = "{used}/{total} GiB ({percentage}%)  ";
            tooltip = false;
          };

          temperature = {
            critical-threshold = 80;
            format = "{temperatureC}°C {icon}";
            format-icons = [
              ""
              ""
              ""
            ];
          };

          battery = {
            format = "{capacity}% {icon}";
          };

          clock = {
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            format = "{0:%H:%M} {0:%Y-%m-%d}";
          };

          tray = {
            spacing = 20;
          };

          "custom/power" = {
            format = "⏻ ";
            tooltip = false;
            menu = "on-click";
            menu-file = "$HOME/.config/waybar/power_menu.xml";
            menu-actions = {
              suspend = "systemctl suspend";
              shutdown = "hyprshutdown --post-cmd 'shutdown -P 0'";
              reboot = "hyprshutdown --post-cmd 'reboot'";
            };
          };
        };

        style = ./style.css;
      };

      home.file = {
        waybar-custom-power = {
          target = ".config/waybar/power_menu.xml";
          source = ./power_menu.xml;
        };
      };
    };
  };
}
