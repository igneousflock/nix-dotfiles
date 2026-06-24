{
  config,
  pkgs,
  lib,
  ...
}:
let
  completions = builtins.readFile ./completions.zsh;
  keybindings = builtins.readFile ./keybindings.zsh;
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;

    defaultKeymap = "emacs";

    history = {
      append = true;
      findNoDups = true;
    };

    setOptions = [
      "NOMATCH"
      "NOTIFY"
      "NO_BEEP"
    ];

    # Loal completion settings
    # initContent = lib.mkOrder 550 completions;
    initContent = lib.mkMerge [
      (lib.mkOrder 550 completions)
      (lib.mkOrder 1000 keybindings)
    ];

    # Load plugins manually
    plugins = [
      {
        name = "sudo";
        file = "plugins/sudo/sudo.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "ohmyzsh";
          repo = "ohmyzsh";
          rev = "beadd56dd75e8a40fe0a7d4a5d63ed5bf9efcd48";
          sha256 = "sha256-e3zTM3rj4z6RwDai9i7KKrz6imTGmZiSAqcS9Mw2LZU=";
        };
      }
    ];

    syntaxHighlighting.enable = true;
  };
}
