{
  den.aspects.wofi = {
    homeManager = {
      programs.wofi = {
        enable = true;
        settings = {
          width = "300";
          prompt = "Run application:";
          allow_images = true;
          term = "kitty";
          matching = "fuzzy";
          location = "top_left";
          gtk_dark = true;
          close_on_focus_loss = true;

          key_expand = "Ctrl-Right";
        };
      };
    };
  };
}
