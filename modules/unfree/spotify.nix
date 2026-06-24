{ den, ... }: {
  den.aspects.spotify = {
    includes = [
      (den.batteries.unfree [ "spotify" ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.spotify ];
    };
  };
}
