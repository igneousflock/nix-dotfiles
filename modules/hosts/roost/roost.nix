{ den, ... }: {
  den.aspects.roost = {
    includes = [
      (den.batteries.hostname)
    ];

    provides.to-users.homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          fd
          htop
          ripgrep
          unzip
        ];
      };
  };
}
