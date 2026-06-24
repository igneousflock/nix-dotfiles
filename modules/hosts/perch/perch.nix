{ den, ... }: {
  # host aspect
  den.aspects.perch = {
    includes = [
      (den.batteries.hostname)
      (den.batteries.tty-autologin "igneous")
    ];

    # host NixOS configuration
    nixos =
      { pkgs, ... }:
      {
        imports = [ ./_hardware-configuration.nix ];
        environment.systemPackages = [ pkgs.hello ];
        boot.kernelPackages = pkgs.linuxPackages_latest;
      };

    # host provides default home environment for its users
    provides.to-users.homeManager =
      { pkgs, ... }:
      {
        home.packages = [ pkgs.vim ];
      };
  };
}
