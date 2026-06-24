{
  den.aspects.prism = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.prismlauncher ];
    };
  };
}
