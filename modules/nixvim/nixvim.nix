{ inputs, ... }:
{
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
    };
  };

}
