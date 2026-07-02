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
          server = {
            hostname = "pds.alexvds.com";
            age_assurance_override = true;
            contact_email = "pds@alexvds.com";
            max_blob_size = 1024 * 1014 * 1; # 1 GiB
          };
        };

        environmentFiles = [ config.sops.secrets.tranquil-pds.path ];
      };

      networking.firewall = {
        enable = true;
        allowedTCPPorts = [
          80
          443
        ];
      };

      services.caddy = {
        enable = true;

        virtualHosts = {
          "pds.alexvds.com" = {
            # by default, tranquil runs on port 3000.
            # You can change this with the tranquil-pds.settings.server.port option in the service config.
            extraConfig = ''
              reverse_proxy localhost:3000
            '';
          };
        };
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
