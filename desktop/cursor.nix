{ pkgs, ... }:
{
  programs.hyprcursor-phinger.enable = true;
  # Only applies to XWayland/GTK
  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 24;
    gtk.enable = true;
  };
}
