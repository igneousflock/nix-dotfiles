{
  den.aspects.vpn = { user, ... }: {
    nixos = { pkgs, ... }: {
      services.nordvpn.enable = true;
      environment.systemPackages = with pkgs; [ nordvpn ];
      users.users.${user.name}.extraGroups = [ "nordvpn" ];
    };
  };
}
