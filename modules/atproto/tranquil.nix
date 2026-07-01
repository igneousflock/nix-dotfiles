{ inputs, ... }: {
  flake-file.inputs.tranquil-pds = {
    url = "git+https://tangled.org/tranquil.farm/tranquil-pds";
  };

  den.aspects.tranquil = { user, ... }: {
    nixos = { config, ... }: {
      imports = [ inputs.tranquil-pds.nixosModules.default ];

      services.tranquil-pds = {
        enable = true;
        database.createLocally = true;
        settings = {
          server.hostname = "pds.alexvds.com";
        };

        environmentFiles = [ config.sops.secrets.tranquil-pds.path ];
      };

      sops = {
        defaultSopsFile = ../../secrets/pds.env;
        secrets = {
          tranquil-pds = {
            format = "dotenv";
            key = "";

            owner = user.name;
            group = "wheel";
          };
        };
      };
    };
  };
}
