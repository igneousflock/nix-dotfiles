pkg := ".#" + `hostname`

check:
    nix flake check

switch:
    nix run {{pkg}} -- switch

vm:
    nix run .#vm

flake:
    nix run .#write-flake

update: flake
    nix flake update
