{
  den.aspects.sshd = {
    nixos = {
      services.openssh = {
        enable = true;
        openFirewall = true;
        ports = [ 6767 ];
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
          AllowUsers = [ "catbird" ];
          LoginGraceTime = 30;
          MaxAuthTries = 3;
          AllowTcpForwarding = "no";
          ClientAliveInterval = 300;
          ClientAliveCountMax = 2;
          PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
          PermitEmptyPasswords = "no";
          X11Forwarding = false;
        };
      };
    };
  };
}
