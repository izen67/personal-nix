{ config, pkgs, ... }:

{
  # Bootloader: GRUB
  boot.loader = {
    systemd-boot.enable = false; # dont use systemd-boot

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";  # matches hardware-configuration.nix
    };
    
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      configurationLimit = 10;  # keeps /boot from filling up
    };
  };

  # Switch to official Zen kernel.
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;

  # ZENergy kernel module - needed for MangoHud AMD CPU wattage
  boot.extraModulePackages = [
    config.boot.kernelPackages.zenergy
  ];

  boot.kernelModules = [
    "zenergy"
  ];

  # Add 32 GB swap file
  swapDevices = [
    {
      device = "/swapfile";
      size = 32768; # 32 GB
    }
  ];

  # Limits to prevent system crashes and ease up on the CPU while building
  nix.settings = {
    max-jobs = 1;
    cores = 10;
  };
}
