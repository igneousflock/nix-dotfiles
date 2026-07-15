{ den, ... }:
{
  # user aspect
  den.aspects.igneous = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      _1password
      bat
      discord
      docker
      git
      git.delta
      hyprland
      jj
      kitty
      nixvim
      obsidian
      prism
      shell
      shell.bash
      shell.zsh
      sops
      spotify
      steam
      zen
    ];

    nixos = {
      services.displayManager.autoLogin = {
        enable = true;
        user = "igneous";
      };
    };

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
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = {
      environment.pathsToLink = [ "/share/zsh" ];
    };
  };
}
