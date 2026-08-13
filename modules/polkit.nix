{
  den.aspects.polkit = {
    nixos = {
      security.polkit = {
        enable = true;
        adminIdentities = [ "unix-group:wheel" ];
      };
    };
  };
}
