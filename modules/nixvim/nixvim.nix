{ inputs, ... }: {
  flake-file.inputs.nixvim = {
    url = "github:nix-community/nixvim";
  };

  den.aspects.nixvim = {
    homeManager = {
      imports = [ inputs.nixvim.homeModules.nixvim ];

      programs.nixvim = {
        enable = true;

        imports = [
          ./_plugins

          ./_autocmd.nix
          ./_basic.nix
          ./_keymaps.nix
          ./_lsp.nix
        ];
      };

      home.shellAliases = {
        vim = "nvim";
      };
    };
  };
}
