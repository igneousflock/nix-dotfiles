{ lib, ... }:
{
  plugins.lspconfig.enable = true;
  plugins.lsp-format = {
    enable = true;
    lspServersToEnable = "all";
  };

  plugins.nix.enable = true;

  lsp.servers = {
    nixd.enable = true;
  };

  plugins.rustaceanvim = {
    enable = true;
    settings.standalone = false;
  };
}
