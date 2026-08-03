{ den, ... }: {
  den.aspects.zoom = {
    includes = [
      (den.batteries.unfree [
        "zoom"
      ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.zoom-us ];
    };
  };
}
