{ inputs, ... }: {
  flake-file.inputs.zen-browser = {
    url = "github:youwen5/zen-browser-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  den.aspects.zen = { host, ... }: {
    homeManager = {
      home.packages = [
        inputs.zen-browser.packages.${host.system}.default
      ];

      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = "zen.desktop";
          "x-scheme-handler/http" = "zen.desktop";
          "x-scheme-handler/https" = "zen.desktop";
          "x-scheme-handler/about" = "zen.desktop";
          "x-scheme-handler/unknown" = "zen.desktop";
        };
      };
    };
  };
}
