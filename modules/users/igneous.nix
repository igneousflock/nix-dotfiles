{ den, ... }:
{
  # user aspect
  den.aspects.igneous = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      firefox
      git
      git.verification
      hyprland
      nixvim
      shell
      shell.zsh
      zen
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
    provides.to-hosts.nixos = {
      # Lets zsh completions work
      environment.pathsToLink = [ "/share/zsh" ];
    };
  };
}
