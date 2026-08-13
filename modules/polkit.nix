{
  den.aspects.polkit = {
    nixos = {
      security.sudo = {
        enable = true;
        extraRules = [
          {
            commands = [
              {
                command = "ALL";
                options = [ "NOPASSWD" ];
              }
            ];
            groups = [ "wheel" ];
          }
        ];
      };

      security.polkit = {
        enable = true;
        adminIdentities = [ "unix-group:wheel" ];
      };
    };
  };
}
