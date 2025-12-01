{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      transparent_background = true;
    };
  };

  colorscheme = "catppuccin-frappe";

  globals = {
    mapleader = " ";
    maplocalleader = " ";
    netrw_liststyle = 3;
    netrw_banner = 0;
    netrw_winsize = 80;
    netrw_browse_split = 2;
  };

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

    # Directory listing
    # netrw_liststyle = 3;
    # netrw_banner = 0;
    # netrw_winsize = 25;
  };
}
