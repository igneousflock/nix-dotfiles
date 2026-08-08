{ den, ... }:
{
  # user aspect
  den.aspects.igneous = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      _1password
      aws
      bat
      discord
      docker
      flake-registries
      git
      git.delta
      hyprland
      java
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
      zoom
    ];

    nixos = {
      services.displayManager.autoLogin = {
        enable = true;
        user = "igneous";
      };

      users.users.igneous.extraGroups = [ "dialout" ];
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
