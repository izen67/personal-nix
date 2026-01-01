{ config, pkgs, ... }:

{
  networking = {
    hostName = "pc";
    firewall = {
      allowedTCPPorts = [ ];   # add per-machine exceptions (e.g., [22] for SSH)
    };
  };
}
