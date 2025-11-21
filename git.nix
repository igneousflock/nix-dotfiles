{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        email = "alex@avandesa.dev";
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
}

