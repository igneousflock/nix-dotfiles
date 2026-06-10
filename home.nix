{
  zen-browser,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./desktop
    ./shell

    ./git.nix
    ./kitty.nix
    ./ssh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "igneous";
  home.homeDirectory = "/home/igneous";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "1password"
      "discord"
      "obsidian"
      "spotify"
    ];

  home.packages = with pkgs; [
    hyprpaper
    hyprshutdown
    jq
    man-pages
    man-pages-posix
    nixd
    nixfmt
    obsidian
    prismlauncher
    spotify
    thunderbird
    tree
    wl-clipboard
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };

  programs.bat = {
    enable = true;
    config.theme = "Catppuccin Frappe";
  };

  programs.discord.enable = true;

  programs.nixvim = {
    enable = true;
    imports = [ ./nixvim ];
  };
}
