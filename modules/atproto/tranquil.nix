{ inputs, ... }:
let
  hostname = "pds.alexvds.com";
  email = "pds@alexvds.com";
in
{
  flake-file.inputs.tranquil-pds = {
    url = "git+https://tangled.org/tranquil.farm/tranquil-pds";
  };

  den.aspects.tranquil = { user, ... }: {
    nixos =
      { config, pkgs, ... }:
      let
        secrets = config.sops.secrets;
      in
      {
        imports = [ inputs.tranquil-pds.nixosModules.default ];

        services.tranquil-pds = {
          enable = true;

          database.createLocally = true;

          settings = {
            server = {
              inherit hostname;
              age_assurance_override = true;
              contact_email = email;
              max_blob_size = 1024 * 1014 * 1; # 1 GiB
            };

            email = {
              from_address = email;

              smarthost = {
                host = "smtp.fastmail.com";
                port = 587;
              };
            };
          };

          environmentFiles = [ secrets.tranquil-pds.path ];
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
          package = pkgs.caddy.withPlugins {
            plugins = [ "github.com/caddy-dns/route53@v1.6.2" ];
            hash = "sha256-F/jqR4iEsklJFycTjSaW8B/V3iTGqqGOzwYBUXxRKrc=";
          };

          virtualHosts = {
            ${hostname} = {
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
