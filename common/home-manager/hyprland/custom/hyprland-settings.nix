{ config, ... }:

{
    wayland.windowManager.hyprland.settings = {
        bind = [
            "SUPER, L, exec, swaylock"
            "SUPER, R, exec, fuzzel"
            "SUPER, V, exec, cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
            "SUPER, K, exec, pkill waybar; waybar &"
        ];

        exec-once = [
            "swww-daemon"
            "swww img ~/Pictures/wallpaper.png"
            "sh -c 'sleep 2 && waybar'"
            "nm-applet &"
            "blueman-applet &"
            "wl-paste --type text --watch cliphist store"
            "wl-paste --type image --watch cliphist store"
        ];
    };
}