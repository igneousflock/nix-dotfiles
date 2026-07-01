{ inputs, ... }: {
  flake-file.inputs.sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.sops = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        age
        sops
      ];
    };

    recipient = {
      nixos = {
        imports = [ inputs.sops-nix.nixosModules.sops ];

        sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      };
    };
  };
}
