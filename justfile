pkg := ".#" + `hostname`

check:
    nix flake check

switch:
    nix run {{pkg}} -- switch

test:
    nix run {{pkg}} -- test

vm:
    nix run .#vm

flake:
    nix run .#write-flake

update: flake
    nix flake update

pds-secrets:
    sops secrets/pds.env
