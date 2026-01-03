{ config, pkgs, lib, ... }:

{
  imports = [
    ./hyprland.nix
    ./theme.nix

    # Select noctalia or custom config
    #./custom/default.nix
    ./noctalia/default.nix
  ];
}
