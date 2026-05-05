{ ... }:
{
  imports = [
    ./cursor.nix
    ./hyprpaper.nix
  ];

  # Native hyprland config
  home.file = {
    hyprland = {
      target = ".config/hypr/hyprland.conf";
      source = ./hyprland.conf;
    };
  };

  programs.waybar.enable = true;

  services.hyprlauncher = {
    enable = true;
    settings = {
      finders.desktop_icons = true;
      general.grab_focus = true;
    };
  };
}
