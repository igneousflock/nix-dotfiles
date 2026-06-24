{
  den.aspects.fonts = {
    nixos = { pkgs, ... }: {
      fonts.packages = with pkgs; [
        iosevka
        nerd-fonts.iosevka
      ];
      fonts.fontconfig.defaultFonts = {
        monospace = [
          # "Berkeley Mono"
          "iosevka"
        ];
      };
    };
  };
}
