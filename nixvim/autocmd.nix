{
  autoGroups = {
    kickstart-highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    {
      event = "TextYankPost";
      desc = "Hightlight when yanking text";
      group = "kickstart-highlight-yank";
      callback = {
        __raw = "function() vim.hl.on_yank() end";
      };
    }
  ];
}
