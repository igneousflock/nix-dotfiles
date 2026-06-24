{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;

    themeFile = "Catppuccin-Frappe";
    settings = {
      # font_family = "Berkeley Mono";
      font_family = "family='Berkeley Mono' postscript_name=BerkeleyMono-Regular";
      cursor_trail = 1;

      scrollbar = "hovered";
      scrollbar_width = 1.5;
      scrollbar_hover_width = 1.5;
      scrollbar_radius = 0.5;

      mouse_hide_wait = "1.0 0 0 no";

      strip_trailing_spaces = "smart";

      active_border_color = "blue";
      inactive_border_color = "white";
      bell_border_color = "red";

      inactive_text_alpha = 0.6;

      tab_bar_style = "slant";

      background_opacity = 0.9;
      transparent_background_colors = "#3b3f53@0.9";
    };
    keybindings = {
      "ctrl+up" = "neighboring_window up";
      "ctrl+right" = "neighboring_window right";
      "ctrl+down" = "neighboring_window down";
      "ctrl+left" = "neighboring_window left";
      "ctrl+shfit+p" = "nth_window -1";
      "ctrl+alt+t" = "detach_window new-tab";
    };
  };
}
