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

          # Bring in secrets and smarthost credentials
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
            hash = "sha256-dxrfc6o6PBxRqMRUDpenHDctHUNQx4ZmAy9577RTTKg=";
          };

          virtualHosts = {
            ${hostname} = {
              extraConfig = ''
                reverse_proxy localhost:3000
              '';
            };
          };
        };
        systemd.services.caddy.serviceConfig.EnvironmentFile = [ secrets.caddy.path ];

        sops = {
          secrets = {
            tranquil-pds = {
              sopsFile = ../../secrets/pds.env;
              format = "dotenv";
              key = "";

              owner = user.name;
              group = "wheel";
            };

            caddy = {
              sopsFile = ../../secrets/caddy.env;
              format = "dotenv";
              key = "";
            };
          };
        };
      };
  };
}
