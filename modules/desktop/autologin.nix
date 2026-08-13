{
  den.aspects.autologin = {
    nixos = {
      services.displayManager.autoLogin = {
        enable = true;
        user = "igneous";
      };
    };
  };
}
