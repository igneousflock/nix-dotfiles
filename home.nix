{ config, pkgs, lib, ... }:

{
  imports = [
    ./git.nix
    ./shell/shell.nix
    ./ssh.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "igneous";
  home.homeDirectory = "/home/igneous";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    bat
    nixd
    rustup
  ];

  home.file = {
    nvim = {
      source = ./nvim;
      target = ".config/nvim";
      recursive = true;
    };

    # To facilitate git signature verification
    # SSH fingerprint comes from 1password
    allowedSigners = {
      target = ".config/git/allowedSigners";
      text = ''
        alex@avandesa.dev ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHJ9zhEHFJIpZ4qr6iu3Cqca3mquGCGyiIrcI0e3jXLZ
      '';
    };
  };
}
