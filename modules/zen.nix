{ inputs, ... }:
{
  den.aspects.zen = {
    homeManager =
      { system, ... }:
      {
        home.packages = [
          inputs.zen-browser.packages.${system}.default
        ];
      };
  };
}
