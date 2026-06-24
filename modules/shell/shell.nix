{
  den.aspects.shell = {
    homeManager = {
      home.shellAliases = {
        nix-zsh = "nix-shell --command zsh";
        tree = "tree --gitignore";
      };

      programs.starship = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
      };
    };
  };
}
