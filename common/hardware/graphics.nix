{ config, pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libva
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [
      libva
    ];
  };

  environment.systemPackages = with pkgs; [
    libva-utils
    mesa-demos
    vulkan-tools
  ];

}