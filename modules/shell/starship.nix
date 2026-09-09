{
  den.aspects.starship = {
    homeManager = {
      programs.starship.enable = true;

      home.file.starship = {
        target = ".config/starship.toml";
        source = ./_starship.toml;
      };
    };
  };
}
