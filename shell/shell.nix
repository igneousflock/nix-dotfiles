{ config, pkgs, lib, ... }:
{
  imports = [
    ./bash.nix
    ./zsh.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.shellAliases = {
    clstat = "clear && git status";
    gpl = "git pull";
    vim = "nvim";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs._1password-shell-plugins = {
    enable = true;
  };
}
