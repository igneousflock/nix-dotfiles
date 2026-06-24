{ den, ... }: {
  # host aspect
  den.aspects.perch = {
    includes = [
      (den.batteries.hostname)
      (den.batteries.tty-autologin "igneous")
    ];

    # host NixOS configuration
    nixos = {
      imports = [ ./_hardware-configuration.nix ];
    };

    # host provides default home environment for its users
    provides.to-users.homeManager = { };
  };
}
