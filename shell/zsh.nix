{ config, pkgs, lib, ... }:
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

    # Plugin manager
    zplug = {
      enable = true;
      plugins = [
        { name = "plugins/git"; tags = [ "from:oh-my-zsh" ]; }
        { name = "plugins/sudo"; tags = [ "from:oh-my-zsh" ]; }
        { name = "MichaelAquilina/zsh-you-should-use"; }
        { name = "zsh-users/zsh-completions"; }
      ];
    };

    syntaxHighlighting.enable = true;
  };
}
