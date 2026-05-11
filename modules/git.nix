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
            # signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ";
          };

          # Sign commits with SSH via 1password
          # gpg = {
          #   format = "ssh";
          #   ssh.program = "${pkgs._1password-gui}/bin/op-ssh-sign";
          #   ssh.allowedSignersFile = "~/.config/git/allowedSigners";
          # };
          # commit.gpgsign = true;
        };
      };
    };

    # TODO: test this later
    # signing = {
    #   homeManager =
    #     { pkgs, ... }:
    #     {
    #       programs.git.settings = {
    #         user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ";
    #
    #         # Sign commits with SSH via 1password
    #         gpg = {
    #           format = "ssh";
    #           ssh.program = "${pkgs._1password-gui}/bin/op-ssh-sign";
    #           ssh.allowedSignersFile = "~/.config/git/allowedSigners";
    #         };
    #         commit.gpgsign = true;
    #       };
    #
    #       home.file."1passwordSshAgentConfig" = {
    #         target = ".config/1Password/ssh/agent.toml";
    #         text = ''
    #           [[ssh-keys]]
    #           vault = "Programming"
    #         '';
    #       };
    #     };
    # };

    verification = {
      homeManager = {
        programs.git.settings.gpg.ssh.allowedSignersFile = "~/.config/git/allowedSigners";
        # To facilitate git signature verification
        # SSH fingerprint comes from 1password
        home.file.allowedSigners = {
          target = ".config/git/allowedSigners";
          text = ''
            me@alexvds.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ
          '';
        };
      };
    };
  };
}
