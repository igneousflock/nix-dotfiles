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
        home.packages = [ pkgs.htop ];
      };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = {
      # Lets zsh completions work
      environment.pathsToLink = [ "/share/zsh" ];
    };
  };
}
