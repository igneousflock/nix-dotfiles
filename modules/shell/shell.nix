{ den, ... }: {
  den.aspects.shell = {
    includes = [ den.aspects.starship ];

    homeManager = {
      home.shellAliases = {
        j = "just";
        nix-zsh = "nix-shell --command zsh";
        ndz = "nix develop -c zsh";
        ndv = "nix develop -c nvim";
        tree = "tree --gitignore";
      };
    };
  };
}
