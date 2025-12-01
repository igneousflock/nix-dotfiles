{
  config,
  pkgs,
  lib,
  ...
}:
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
    vim = "nvim";

    ga = "git add";
    gaa = "git add .";
    gc = "git commit --message";
    gca = "git commit --amend";
    "gca!" = "git commit --amend --no-edit";
    gd = "git diff";
    gds = "git diff --staged";
    glol = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\"";
    glola = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\" --all";
    gp = "git push";
    "gp!" = "git push --force";
    gpl = "git pull";

    tree = "tree --gitignore";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs._1password-shell-plugins = {
    enable = true;
  };
}
