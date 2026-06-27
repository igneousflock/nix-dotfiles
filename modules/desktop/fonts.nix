{
  den.aspects.fonts = {
    nixos = { pkgs, ... }: {
      fonts.enableDefaultPackages = true;

      fonts.packages = with pkgs; [
        iosevka
        nerd-fonts.iosevka
      ];

      fonts.fontconfig.defaultFonts = {
        monospace = [
          "Berkeley Mono"
          "Iosevka"
        ];
      };
    };
  };
}
