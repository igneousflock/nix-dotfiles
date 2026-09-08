{
  den.aspects.ghostty = {
    homeManager = {
      programs.ghostty = {
        enable = true;

        settings = {
          font-family = "Berekeley Mono";
          theme = "Catppuccin Frappe";

          background-opacity = 0.9;

          window-inherit-working-directory = false;
          shell-integration-features = "cursor,sudo,title,ssh-env,ssh-terminfo";

          gtk-wide-tabs = false;

          keybind = [
            "performable:ctrl+shift+z=jump_to_prompt:-1"
            "performable:ctrl+shift+x=jump_to_prompt:+1"
          ];
        };
      };
    };
  };
}
