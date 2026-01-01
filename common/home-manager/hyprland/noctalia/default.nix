{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./noctalia.nix
    ./hyprland-settings.nix
  ];
}
