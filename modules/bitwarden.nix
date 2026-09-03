{
  den.aspects.bitwarden = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = [
        pkgs.bitwarden-desktop
      ];
    };

    homeManager = {
      sshAuthSock = {
        enable = true;
        initialization =
          let
            init = "export SSH_AUTH_SOCK=$HOME/.bitwarden-ssh-agent.sock";
          in
          {
            zsh = init;
            bash = init;
          };
        systemd.socketProviderUnit = "ssh-agent.service";
      };

      programs.git.settings = {
        # Sign commits with SSH via 1password
        gpg = {
          format = "ssh";
          ssh.allowedSignersFile = "~/.config/git/allowedSigners";
        };
        commit.gpgsign = true;
      };

      programs.jujutsu.settings = {
        signing = {
          behavior = "own";
          backend = "ssh";
          key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ";
          backends.ssh = {
            allowed-signers = ".config/git/allowedSigners";
          };
        };
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
            identityAgent = "~/.bitwarden-ssh-agent.sock";
            serverAliveCountMax = 3;
            serverAliveInterval = 0;
            userKnownHostsFile = "~/.ssh/known_hosts";
          };
          "15.204.234.43" = {
            forwardAgent = true;
            port = 6767;
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
      };
    };
  };
}
