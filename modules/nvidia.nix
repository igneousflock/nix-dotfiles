{ den, ... }: {
  den.aspects.nvidia = {
    includes = [
      (den.batteries.unfree [
        "nvidia-kernel-modules"
        "nvidia-settings"
        "nvidia-x11"
      ])
    ];

    nixos = { config, ... }: {
      # Enable Open GL
      hardware.graphics.enable = true;

      # Load NVIDIA drivers
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        # Required
        modesetting.enable = true;

        powerManagement.enable = true;

        # Disable open-source kernel module, 1070 not compatible
        open = false;

        # Enable the settings menu via `nvidia-settings`
        nvidiaSettings = true;

        # Use legacy driver for GTX 1070
        package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
      };
    };
  };
}
