let
  mkBuiltinKeymap =
    { action, desc }:
    {
      inherit action;
      options = { inherit desc; };
    };
in
{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };
    keymaps = {
      "<leader>sh" = mkBuiltinKeymap {
        action = "help_tags";
        desc = "[S]earch [H]elp";
      };
      "<leader>sk" = mkBuiltinKeymap {
        action = "keymaps";
        desc = "[S]earch [K]eymaps";
      };
      "<leader>sf" = mkBuiltinKeymap {
        action = "find_files";
        desc = "[S]earch [F]iles";
      };
      "<leader>ss" = mkBuiltinKeymap {
        action = "builtin";
        desc = "[S]earch [S]elect Telescope";
      };
      "<leader>sw" = mkBuiltinKeymap {
        action = "grep_string";
        desc = "[S]earch current [W]ord";
      };
      "<leader>sg" = mkBuiltinKeymap {
        action = "live_grep";
        desc = "[S]earch by [G]rep";
      };
      "<leader>sd" = mkBuiltinKeymap {
        action = "diagnostics";
        desc = "[S]earch [D]iagnostics";
      };
      "<leader>sr" = mkBuiltinKeymap {
        action = "resume";
        desc = "[S]earch [R]esume";
      };
      "<leader>s." = mkBuiltinKeymap {
        action = "oldfiles";
        desc = "[S]earch Recent Files ('.' for repeat)";
      };
      "<leader><leader>" = mkBuiltinKeymap {
        action = "buffers";
        desc = "[ ] Find existing buffers";
      };
    };
  };
}
