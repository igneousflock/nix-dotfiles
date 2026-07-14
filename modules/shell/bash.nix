{
  den.aspects.shell.bash = {
    homeManager = {
      programs.bash = {
        enable = true;
        historyIgnore = [
          "ls"
          "cd"
          "exit"
        ];
      };
    };
  };
}
