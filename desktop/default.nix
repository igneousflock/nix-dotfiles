{ ... }:
{
  imports = [
    ./cursor.nix
    ./hyprland.nix
    ./hyprpaper.nix
  ];

  programs.waybar.enable = true;

  services.hyprlauncher = {
    enable = true;
    settings = {
      finders.desktop_icons = true;
      general.grab_focus = true;
    };
  };
}
