{ inputs, ... }: {
  flake-file.inputs = {
    eza-themes = {
      url = "github:eza-community/eza-themes";
      flake = false;
    };
  };

  den.aspects.eza = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.eza ];

      home.shellAliases =
        let
          eza = "eza --icons auto";
          eza-long = "${eza} --long --git --time-style iso";
        in
        {
          ls = eza;
          lsl = eza-long;
          lst = "${eza-long} --tree";
          ls2 = "${eza-long} --tree --level 2";
          ls3 = "${eza-long} --tree --level 3";
          tree = "${eza} --tree";
        };

      xdg.configFile.eza-theme = {
        source = "${inputs.eza-themes}/themes/catppuccin-frappe.yml";
        target = "eza/theme.yml";
      };
    };
  };
}
