{ den, ... }: {
  den.aspects.discord = {
    includes = [
      (den.batteries.unfree [ "discord" ])
    ];

    homeManager = {
      programs.discord.enable = true;
    };
  };
}
