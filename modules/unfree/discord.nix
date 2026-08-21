{ den, ... }: {
  den.aspects.discord = {
    includes = [
      (den.batteries.unfree [ "discord" "discord-unwrapped" ])
    ];

    homeManager = {
      programs.discord.enable = true;
    };
  };
}
