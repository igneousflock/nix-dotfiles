{
  den.aspects.docker = {
    nixos = { user, ... }: {
      virtualisation.docker = {
        enable = true;
      };
      users.users.${user.name}.extraGroups = [ "docker" ];
    };
  };
}
