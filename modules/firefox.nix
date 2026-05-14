{
  den.aspects.firefox = {
    homeManager = {
      programs.firefox = {
        enable = true;
        # TODO: migrate to new path (remove this line, see warning)
        configPath = ".mozilla/firefox";
      };
    };
  };
}
