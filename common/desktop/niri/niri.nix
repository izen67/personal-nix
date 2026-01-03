{ config, pkgs, lib, ... }:

{
  # ────────────────────────────── Compositor ──────────────────────────────
  programs.niri.enable = true;

  # XWayland support for legacy X11 apps
  programs.xwayland.enable = true;

  # ────────────────────────────── Authentication ──────────────────────────────
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # PAM for swaylock (used across compositors)
  security.pam.services.swaylock = {};

  # ────────────────────────────── XDG Portals ──────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk    # fallback/basic portal
      xdg-desktop-portal-gnome  # screencast + secret portal integration
    ];
    config.common.default = "gnome";
  };

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;

    defaultApplications = {
      "inode/directory" = [ "nemo.desktop" ];
      "x-directory/normal" = [ "nemo.desktop" ];
    };
  };
  
  # ────────────────────────────── System Packages ──────────────────────────────
  environment.systemPackages = with pkgs; [

    ## Core tools
    axel 
    bc 
    ripgrep 
    libqalculate 
    libnotify
    playerctl 
    brightnessctl 
    ddcutil
    wireplumber 
    networkmanager 
    easyeffects
    wl-clipboard 
    wf-recorder
    mpv 
    cliphist 
    gnome-settings-daemon
    gsettings-desktop-schemas
    libdbusmenu-gtk3

    ## Wayland / Hyprland stack
    wayland-protocols 
    xdg-user-dirs 
    xorg.xhost

    ## Network & Bluetooth applets
    networkmanagerapplet 
    blueman

    ## File management / Desktop
    nemo-with-extensions
    gnome-disk-utility           
    gnome-system-monitor        
    kdePackages.systemsettings
    kdePackages.plasma-systemmonitor
    kdePackages.plasma-workspace # needed for xembedsniproxy
  ];

  # ────────────────────────────── Fonts ────────────────────────────── 
  fonts.fontconfig.enable = true;
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    material-symbols 
    rubik
    nerd-fonts.jetbrains-mono 
    nerd-fonts.ubuntu 
    nerd-fonts.ubuntu-mono
    nerd-fonts.caskaydia-cove 
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.mononoki 
    nerd-fonts.space-mono
    maple-mono.Normal-NF
  ];

  # ────────────────────────────── File Management Services ──────────────────────────────
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
