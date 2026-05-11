{
  den.aspects.shell = {
    homeManager = {
      home.shellAliases = {
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
