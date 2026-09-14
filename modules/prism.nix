{
  den.aspects.prism = {
    homeManager = { pkgs, ... }: {
      home.packages = [ pkgs.jdk25 ];

      programs.prismlauncher = {
        enable = true;
        settings = {
          ApplicationTheme = "dark";
          AutomaticJavaDownload = false;
          IconTheme = "pe_light";
          JavaPath = "${pkgs.jdk25}/bin/java";
          Language = "en_US";
          LastHostname = "flock";
          MaxMemAlloc = 8192;
          MinMemAlloc = 1024;
          UseSystemLocale = true;
          UserAskedAboutAutomaticJavaDownload = true;
        };
      };
    };
  };
}
