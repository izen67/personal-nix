{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
    haruna
    spotify
    (chromium.override { enableWideVine = true; })
    brave
    qbittorrent
    libreoffice-fresh
    discord
    #discord-canary
    #vesktop
    filen-desktop
    jellyfin-desktop

    # from external personal flake
    #personal.blender-bin
    #personal.gmodpatchtool-bin
  ];
}
