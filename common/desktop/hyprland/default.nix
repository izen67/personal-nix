{ config, inputs, user, ... }:

{
    imports = [
        ./login/greetd.nix
        ./hyprland.nix
    ];

# Attach hyprland Home Manager configs only when this desktop is active
  home-manager.users.${user}.imports = [
    # Main hm hyprland import
    ../../home-manager/hyprland/default.nix
  ];
}
