{ config, ... }:

{
    wayland.windowManager.hyprland.settings = {
        bind = [
            "SUPER, R, exec, noctalia-shell ipc call launcher toggle"
            "SUPER, L, exec, noctalia-shell ipc call lockScreen lock"
            "SUPER, V, exec, noctalia-shell ipc call launcher clipboard"
        ];

        exec-once = [
            
        ];
    };
}