{ inputs, ... }: {
  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.nixvim = {
    homeManager = {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        enable = true;
        # surpress horrible noisy warning
        nixpkgs.source = inputs.nixpkgs;

        imports = [
          ./_plugins

          ./_autocmd.nix
          ./_basic.nix
          ./_keymaps.nix
          ./_lsp.nix
        ];
      };

      home.sessionVariables = {
        EDITOR = "nvim";
      };

      home.shellAliases = {
        vim = "nvim";
      };
    };
  };
}
