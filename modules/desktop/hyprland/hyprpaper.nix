{
  den.aspects.hyprland.hyprpaper = {
    homeManager = {
      services.hyprpaper = {
        enable = true;
        settings = {
          preload = [ "~/Pictures/nomo2.jpg" ];
          wallpaper = [
            {
              monitor = "HDMI-A-2";
              path = "~/Pictures/nomo2.jpg";
            }
            {
              monitor = "eDP-1";
              path = "~/Pictures/nomo2.jpg";
            }
          ];
          splash = false;
        };
      };
    };
  };
}
