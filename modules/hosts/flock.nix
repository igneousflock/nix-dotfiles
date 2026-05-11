{ den, ... }:
{
  den.hosts.x86_64-linux.flock.users.igneous = { };

  # host aspect
  den.aspects.flock = {
    includes = [
      (den.batteries.hostname)
    ];

    # host NixOS configuration
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.hello ];
      };

    # host provides default home environment for its users
    provides.to-users.homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.vim ];
      };
  };
}
