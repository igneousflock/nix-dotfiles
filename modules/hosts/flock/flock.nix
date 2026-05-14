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
        imports = [ ./_hardware-configuration.nix ];

        # Use latest kernel.
        boot.kernelPackages = pkgs.linuxPackages_latest;

        environment.systemPackages = [ pkgs.hello ];
      };
  };
}
