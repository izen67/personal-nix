{ config, pkgs, lib, user, ... }:

{
  # ────────────────────────────── Compositor ──────────────────────────────
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
    systemd.setPath.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  # ────────────────────────────── Authentication ──────────────────────────────
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  # PAM for swaylock (used across compositors)
  security.pam.services.swaylock = {};

  # ────────────────────────────── XDG Portals ──────────────────────────────
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.common.default = "hyprland";
  };

  # ────────────────────────────── MIME Defaults ──────────────────────────────
  xdg.mime = {
    enable = true;
    defaultApplications = {
      # File manager
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      "x-directory/normal" = [ "org.gnome.Nautilus.desktop" ];
  
      # Text and scripts
      "text/plain" = [ "org.kde.kate.desktop" ];
      "application/x-shellscript" = [ "org.kde.kate.desktop" ];
  
      # Terminal integration (required for Nemo)
      "application/x-terminal-emulator" = [ "kitty.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ];
  
      # Images
      "image/png" = [ "org.kde.gwenview.desktop" ];
      "image/jpeg" = [ "org.kde.gwenview.desktop" ];
      "image/webp" = [ "org.kde.gwenview.desktop" ];
      "image/gif" = [ "org.kde.gwenview.desktop" ];
      "image/svg+xml" = [ "org.kde.gwenview.desktop" ];
      "image/*" = [ "org.kde.gwenview.desktop" ];
  
      # Video
      "video/mp4" = [ "org.kde.haruna.desktop" ];
      "video/x-matroska" = [ "org.kde.haruna.desktop" ];
      "video/webm" = [ "org.kde.haruna.desktop" ];
      "video/quicktime" = [ "org.kde.haruna.desktop" ];
      "video/*" = [ "org.kde.haruna.desktop" ];
  
      # Audio
      "audio/mpeg" = [ "org.kde.haruna.desktop" ];
      "audio/flac" = [ "org.kde.haruna.desktop" ];
      "audio/ogg" = [ "org.kde.haruna.desktop" ];
      "audio/wav" = [ "org.kde.haruna.desktop" ];
      "audio/x-m4a" = [ "org.kde.haruna.desktop" ];
      "audio/aac" = [ "org.kde.haruna.desktop" ];
      "audio/*" = [ "org.kde.haruna.desktop" ];
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
    ydotool 
    gnome-settings-daemon
    libdbusmenu-gtk3

    ## Wayland / Hyprland stack
    wayland-protocols 
    xdg-user-dirs 
    xorg.xhost

    ## Network & Bluetooth applets
    networkmanagerapplet 
    blueman

    ## File management / Desktop
    gnome-disk-utility
    file-roller
    nautilus
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

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
