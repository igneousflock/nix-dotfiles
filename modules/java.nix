{ den, ... }: {
  den.aspects.java = {
    includes = [
      (den.batteries.unfree [ "idea" ])
    ];

    nixos = { pkgs, ... }: {
      programs.nix-ld = {
        enable = true;
      };

      environment.systemPackages = [ pkgs.jetbrains.idea ];
    };

    homeManager = {
      programs.java.enable = true;
    };
  };
}
