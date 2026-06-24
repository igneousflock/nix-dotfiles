{ den, ... }: {
  den.aspects.obsidian = {
    includes = [
      (den.batteries.unfree [ "obsidian" ])
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.obsidian ];
    };
  };
}
