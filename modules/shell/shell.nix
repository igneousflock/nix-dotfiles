{
  den.aspects.shell = {
    homeManager = {
      home.shellAliases = {
        j = "just";
        nix-zsh = "nix-shell --command zsh";
        ndz = "nix develop -c zsh";
        ndv = "nix develop -c nvim";
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
