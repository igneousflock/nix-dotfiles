{ ... }:
{
  imports = [
    ./cursor.nix
    ./hyprpaper.nix
  ];

  home.file = {
    hyprland = {
      target = ".config/hypr/hyprland.conf";
      source = ./hyprland.conf;
    };
  };
}
