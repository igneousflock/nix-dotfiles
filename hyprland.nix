{
  pkgs,
  ...
}:

{
  home.file = {
    hyprland = {
      target = ".config/hypr/hyprland.conf";
      source = ./hyprland.conf;
    };
  };

  programs.hyprcursor-phinger.enable = true;
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/Pictures/nomo2.jpg" ];
      wallpaper = [ "HDMI-A-2,~/Pictures/nomo2.jpg" ];
    };
  };

  # Only applies to XWayland/GTK
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
  };

}
