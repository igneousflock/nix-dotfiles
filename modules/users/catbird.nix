{ den, ... }:
{
  den.aspects.catbird = {
    includes = with den.aspects; [
      den.batteries.define-user
      den.batteries.primary-user

      git
      nixvim
      shell
      shell.bash
      shell.zsh

      tranquil.pds
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
      };

    provides.to-hosts.nixos = {
      environment.pathsToLink = [ "/share/zsh" ];
    };
  };
}
