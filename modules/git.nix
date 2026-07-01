{
  den.aspects.git = {
    homeManager = {
      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "main";
          user = {
            email = "me@alexvds.com";
            name = "Alex van de Sandt";
            signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ";
          };
        };
      };

      home.shellAliases = {
        clstat = "clear && git status";
        ga = "git add";
        gaa = "git add .";
        gc = "git commit --message";
        gca = "git commit --amend";
        "gca!" = "git commit --amend --no-edit";
        gd = "git diff";
        gds = "git diff --staged";
        glol = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\"";
        glola = "git log --graph --pretty=\"%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset\" --all";
        gp = "git push";
        "gp!" = "git push --force";
        gpl = "git pull";
        gr = "git restore";
        grs = "git restore --staged";
        gs = "git status";
      };
    };

    delta = {
      homeManager = {
        programs.delta = {
          enable = true;
          enableGitIntegration = true;

          options = {
            line-numbers = true;
            line-numbers-left-style = "cyan";
            line-numbers-right-style = "cyan";
          };
        };

        home.sessionVariables.DELTA_PAGER = "less -R";
      };
    };
  };
}
