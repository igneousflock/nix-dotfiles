{
  den.aspects.flake-registries = {
    nixos = {
      nix.registry.my-flake-templates = {
        from = {
          id = "my-flake-templates";
          type = "indirect";
        };
        to = {
          type = "github";
          owner = "igneousflock";
          repo = "flake-templates";
        };
      };
    };
  };
}
