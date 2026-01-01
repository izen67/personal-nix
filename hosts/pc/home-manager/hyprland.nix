{ config, pkgs, ... }:

{

# These are host specific settings that shouldnt go in the common config

  wayland.windowManager.hyprland.extraConfig = ''
    # ──────── Monitor layout ────────
    monitor = HDMI-A-1,1920x1080@60,0x0,1
    #monitor = DP-1,1920x1080@60,1920x-650,1,transform,1 #vertical
    monitor = DP-1,1920x1080@60,1920x0,1 # horizontal

    # ───── Workspaces ─────
    # Monitor 1: HDMI-A-1 → workspaces 1-5
    workspace = 1, monitor:HDMI-A-1, persistent:true, default:true
    workspace = 2, monitor:HDMI-A-1, persistent:true
    workspace = 3, monitor:HDMI-A-1, persistent:true
    workspace = 4, monitor:HDMI-A-1, persistent:true
    workspace = 5, monitor:HDMI-A-1, persistent:true

    # Monitor 2: DP-1 → workspaces 6-10
    workspace = 6, monitor:DP-1, persistent:true
    workspace = 7, monitor:DP-1, persistent:true
    workspace = 8, monitor:DP-1, persistent:true
    workspace = 9, monitor:DP-1, persistent:true
    workspace = 10, monitor:DP-1, persistent:true, default:true

    # ──────── Window rules ────────
    # MPV
    windowrulev2 = workspace 10, noinitialfocus, class:^(mpv)$

    # All Steam UI (main window, friends list, etc.)
    windowrulev2 = workspace 4, class:^(steam)$

    # Steam games
    windowrulev2 = workspace 5, class:^(steam_app.*)$

    # Discord
    windowrulev2 = workspace 3, noinitialfocus, class:^(discord*)$

    # Firefox
    windowrulev2 = workspace 2, class:^(firefox*)$

    #mpv:
    exec-once = sh -c 'sleep 10 && /run/current-system/sw/bin/mpv --no-input-default-bindings --no-border --video-unscaled=yes --no-keepaspect --panscan=1.0 --mute=yes rtsp://192.168.50.227:554/11'
    '';
}