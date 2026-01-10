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
    windowrule {
      name = mpv
      workspace = 10
      no_initial_focus = on
      match:class = ^(mpv)$
    }
    
    # Steam - Main window tiled
    windowrule {
      name = steam-tile
      tile = on
      match:class = ^(steam)$
      match:title = ^(Steam)$
    }
    
    # Steam - All other windows float
    windowrule {
      name = steam-float
      float = on
      match:class = ^(steam)$
      match:title = ^(?!Steam$).*
    }

    # All Steam UI (main window, friends list, etc.)
    windowrule {
      name = steam-workspace
      workspace = 4
      match:class = ^(steam)$
    }

    # Steam games
    windowrule {
      name = steam-games-workspace
      workspace = 5
      match:class = ^(steam_app.*)$
    }

    # Discord
    windowrule {
      name = discord-workspace
      workspace = 3
      no_initial_focus = on
      match:class = ^(discord*)$
    }

    # Firefox
    windowrule {
      name = firefox-workspace
      workspace = 2
      match:class = ^(firefox*)$
    }

    # ──────── Execs ────────
    #mpv:
    exec-once = sh -c 'sleep 10 && /run/current-system/sw/bin/mpv --no-input-default-bindings --no-border --video-unscaled=yes --no-keepaspect --panscan=1.0 --mute=yes rtsp://192.168.50.227:554/11'
    '';
}
