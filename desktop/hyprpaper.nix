{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/nomo2.jpg" ];
      wallpaper = [
        {
          monitor = "HDMI-A-2";
          path = "~/Pictures/nomo2.jpg";
        }
      ];
    };
  };
}
