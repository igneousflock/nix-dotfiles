{
  den.aspects.goat = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [ pkgs.atproto-goat ];
    };
  };
}
