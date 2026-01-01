{ config, pkgs, ... }:

{
  #SET CAMERA ON STARTUP
  home.file.".config/autostart/mpv-stream.desktop".source = ../../../assets/mpv-stream.desktop;
  #home.file.".config/autostart/mpv-stream.desktop".force = true;
  
  #SET WINDOW SIZES AND POSITIONS
  home.file.".config/kwinrulesrc".source = ../../../assets/kwinrulesrc;
  #home.file.".config/kwinrulesrc".force = true;
  
  #SET DRAWING TABLET BINDS
  home.file.".config/kcminputrc".source = ../../../assets/kcminputrc;
  #home.file.".config/kcminputrc".force = true;

  #WALLPAPER
  home.file."Pictures/wallpaper.png".source = ../../../assets/wallpaper.png;
  #home.file."Pictures/wallpaper.png".force = true;

}
