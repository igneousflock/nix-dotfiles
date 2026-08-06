{
  den.aspects.java = {
    nixos = {
      programs.nix-ld = {
        enable = true;
      };

    };

    homeManager = {
      programs.java.enable = true;
    };
  };
}
