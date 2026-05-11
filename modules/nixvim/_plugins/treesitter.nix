{
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = false;
      highlight.enable = true;
      incremental_selection.enable = true;
    };
  };

  plugins.treesitter-context = {
    enable = true;
  };

  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select.enable = true;
      swap.enable = true;
    };
  };
}
