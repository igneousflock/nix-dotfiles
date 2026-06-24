{
  den.aspects.shell.bash = {
    homeManager = {
      programs.bash = {
        enable = true;
        historyFile = "~/.bashhistfile";
        historyIgnore = [
          "ls"
          "cd"
          "exit"
        ];
      };
    };
  };
}
