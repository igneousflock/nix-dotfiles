{ den, ... }: {
  den.aspects.dunst = {
    homeManager = {
      services.dunst.enable = true;
    };
  };
}
