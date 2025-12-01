{
  autoGroups = {
    kickstart-highlight-yank.clear = true;
    VimStartup.clear = true;
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
    {
      event = "VimEnter";
      desc = "Open netrw when opening vim with no files";
      group = "VimStartup";
      command = "if expand(\"%\") == \"\" | e . | endif";
    }
  ];
}
