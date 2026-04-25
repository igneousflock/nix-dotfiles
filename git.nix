{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        email = "me@alexvds.com";
        name = "Alex van de Sandt";
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ";
      };

      # Sign commits with SSH via 1password
      gpg = {
        format = "ssh";
        ssh.program = "${pkgs._1password-gui}/bin/op-ssh-sign";
        ssh.allowedSignersFile = "~/.config/git/allowedSigners";
      };
      commit.gpgsign = true;
    };
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "me@alexvds.com";
        name = "Alex van de Sandt";
      };

      signing = {
        sign-all = true;
        backend = "ssh";
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ";
        backends.ssh = {
          program = "${pkgs._1password-gui}/bin/op-ssh-sign";
          allowedSignersFile = "~/.config/git/allowedSigners";
        };
      };
    };
  };
}
