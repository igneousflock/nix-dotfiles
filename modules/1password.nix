{ den, ... }: {
  den.aspects._1password = { user, ... }: {
    includes = [
      (den.batteries.unfree [
        "1password"
        "1password-cli"
      ])
    ];

    autostart.exec-once = [
      "1password --silent &"
    ];

    nixos = {
      programs._1password.enable = true;
      programs._1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "${user.name}" ];
      };
    };

    homeManager = { pkgs, ... }: {
      programs.git.settings = {
        # Sign commits with SSH via 1password
        gpg = {
          format = "ssh";
          ssh.program = "${pkgs._1password-gui}/bin/op-ssh-sign";
          ssh.allowedSignersFile = "~/.config/git/allowedSigners";
        };
        commit.gpgsign = true;
      };

      programs.ssh = {
        enable = true;
        enableDefaultConfig = false;
        settings = {
          "*" = {
            addKeysToAgent = "no";
            compression = false;
            controlMaster = "no";
            controlPath = "~/.ssh/master-%r@%n:%p";
            controlPersist = "no";
            forwardAgent = false;
            hashKnownHosts = false;
            identityAgent = "~/.1password/agent.sock";
            serverAliveCountMax = 3;
            serverAliveInterval = 0;
            userKnownHostsFile = "~/.ssh/known_hosts";
          };
          "15.204.234.43" = {
            forwardAgent = true;
          };
        };
      };

      home.file = {
        # To facilitate git signature verification
        # SSH fingerprint comes from 1password
        allowedSigners = {
          target = ".config/git/allowedSigners";
          text = ''
            alex@avandesa.dev ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ
          '';
        };

        "1passwordSshAgentConfig" = {
          target = ".config/1Password/ssh/agent.toml";
          text = ''
            [[ssh-keys]]
            vault = "Programming"
          '';
        };
      };
    };
  };
}
