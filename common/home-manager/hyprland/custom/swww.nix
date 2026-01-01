{ config, pkgs, ... }:

{
  services.swww = {
    enable = true;
    package = pkgs.swww;
    extraArgs = [ "--no-cache" ];
  };
}
