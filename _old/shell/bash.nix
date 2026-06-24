{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.bash = {
    enable = true;
    historyFile = ".bashhistfile";
    historyIgnore = [
      "ls"
      "cd"
      "exit"
    ];
  };
}
