{ den, ... }: {
  den.aspects.steam = {
    includes = [
      (den.batteries.unfree [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ])
    ];

    nixos = {
      programs.steam.enable = true;
    };
  };
}
