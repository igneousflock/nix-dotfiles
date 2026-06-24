{ den, ... }:
{
  # user aspect
  den.aspects.igneous = {
    includes = [
      den.batteries.define-user
      den.batteries.primary-user
      (den.batteries.user-shell "zsh")
    ];

    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          jq
          man-pages
          man-pages-posix
          nixd
          nixfmt
          tree
        ];

        programs.bat = {
          enable = true;
          config.theme = "Catppuccin Frappe";
        };
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: {
      environment.pathsToLink = [ "/share/zsh" ];
    };
  };
}
