{ inputs, ... }: {
  flake-file.inputs.tranquil-pds = {
    url = "git+https://tangled.org/tranquil.farm/tranquil-pds";
  };

  den.aspects.tranquil = {
    nixos = {
      imports = [ inputs.tranquil-pds.nixosModules.default ];

      services.tranquil-pds = {
        enable = false;
        database.createLocally = true;
        settings = {
          server.hostname = "pds.alexvds.com";
        };

        environmentFiles = [ "/etc/secrets/tranquil.env.production" ];
      };
    };
  };
}
