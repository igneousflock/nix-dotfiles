{
  colorschemes.catppuccin = {
    enable = true;
    # opts = { flavor = "frappe"; };
  };

  colorscheme = "catppuccin-frappe";

  extraConfigLuaPre = ''
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '
  '';

  opts = {
    number = true;
    relativenumber = true;
    scrolloff = 10;
    cursorline = true;

    tabstop = 4;
    shiftwidth = 4;
    expandtab = true;

    mouse = "a";

    showmode = false;

    breakindent = true;
    undofile = true;

    # Case-insensitive search, unless search has >=1 capital letter
    ignorecase = true;
    smartcase = true;

    signcolumn = "yes";

    updatetime = 250;
    timeoutlen = 300;

    splitright = true;
    splitbelow = true;

    inccommand = "split";

    confirm = true;
  };
}
