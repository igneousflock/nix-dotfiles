{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        email = "alex@avandesa.dev";
        name = "Alex van de Sandt";
      };
    };
  };
}
