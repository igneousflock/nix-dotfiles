{ inputs, ... }:
let
  hostname = "pds.alexvds.com";
  email = "pds@alexvds.com";

  one_gib = 1024 * 1024 * 1024;
in
{
  flake-file.inputs.tranquil-pds = {
    url = "git+https://tangled.org/tranquil.farm/tranquil-pds";
  };

  den.aspects.tranquil.local-dev = {
    nixos = {
      networking.hosts = {
        "127.0.0.1" = [ "pds.test" ];
      };
    };
  };

  den.aspects.tranquil.pds = { user, ... }: {
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
              max_blob_size = one_gib; # 1 GiB

              disable_account_verification_gate = true;
            };

            import.max_size = one_gib * 4; # 4 GiB

            storage = {
              backend = "s3";
              s3_bucket = "blob.pds.alexvds.com";
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

          virtualHosts =
            let
              extraConfig = ''
                reverse_proxy localhost:3000
                tls {
                  dns route53 {
                    region "us-east-1"
                  }
                }
                request_body {
                  max_size 1GiB
                }
                @importRepo {
                  method POST
                  path /xrpc/com.atproto.repo.importRepo
                }
                request_body @importRepo {
                  max_size 1GiB
                }
              '';
            in
            {
              ${hostname} = { inherit extraConfig; };
              "*.${hostname}" = { inherit extraConfig; };
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
