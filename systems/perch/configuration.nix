{
  config,
  pkgs,
  hyprland,
  ...
}:
{
  # Firmware update service
  services.fwupd.enable = true;

  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable container management
  boot.enableContainers = true;

  networking.hostName = "perch";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
    withUWSM = true;
  };

  # Use hyprland cachix
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable OpenGL
  hardware.graphics.enable = true;

  # Load NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Required
    modesetting.enable = true;

    # Disable open-source kernel module, 1070 not compatible
    open = false;

    # Enable the settings menu via `nvidia-settings`
    nvidiaSettings = true;

    # Use legacy driver for GTX 1070
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.igneous = {
    isNormalUser = true;
    description = "joan";
    shell = pkgs.zsh;
    extraGroups = [
      "dialout"
      "input"
      "networkmanager"
      "wheel"
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "igneous";

  # Install firefox.
  programs.firefox.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.vim.enable = true;

  environment.systemPackages = with pkgs; [
    fd
    git
    htop
    pavucontrol
    ripgrep
    unzip
  ];

  fonts.packages = with pkgs; [
    iosevka
    nerd-fonts.iosevka
  ];
  fonts.fontconfig.defaultFonts = {
    monospace = [
      "Berkeley Mono"
      "iosevka"
    ];
  };

  # Lets zsh completions work
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh = {
    enable = true;
    enableCompletion = false;
    enableGlobalCompInit = false;
  };

  security.polkit.enable = true;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (pkgs.lib.getName pkg) [
      "1password"
      "1password-cli"
      "chromium"
      "nvidia-settings"
      "nvidia-kernel-modules"
      "nvidia-x11"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];
  programs.steam = {
    enable = true;
  };
  programs._1password = {
    enable = true;
  };
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "igneous" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
