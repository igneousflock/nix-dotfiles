{ inputs, ... }: {
  flake-file.inputs.tranquil-pds = {
    url = "git+https://tangled.org/tranquil.farm/tranquil-pds";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.tranquil = {
    nixos = { config, ... }: {
      imports = [ inputs.tranquil-pds.nixosModules.default ];

      services.tranquil-pds = {
        enable = false;
        database.createLocally = true;
        settings = {
          server.hostname = "pds.alexvds.com";
        };

        environmentFiles = [ ];
      };

      sops.secrets = {
        jwt_secret = { };
        dpop_secret = { };
        master_key = { };
      };
    };
  };
}
