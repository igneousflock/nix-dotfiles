{
  den.aspects.ly = {
    nixos = {
      services.displayManager.ly = {
        enable = true;
        settings = {
          animation = "gameoflife";
          gameoflife_fg = "0x00A3A3A3";
          gameoflife_frame_delay = 10;
          gameoflife_initial_density = 0.3;
          bigclock = true;
          bigclock_seconds = false;
          border_fg = "0x00800080";
          clear_password = true;
          numlock = true;
          show_password_key = false;
        };
      };
    };
  };
}
