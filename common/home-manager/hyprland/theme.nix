{ config, pkgs, ... }:

{
  # GTK (GTK3 + GTK4)

  gtk = {
    enable = true;

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Noto Sans";
      size = 11;
    };
  };

  
  # GTK4 / libadwaita dark mode
  # This is the global dark-mode switch that GTK4,
  # libadwaita, portals, Electron, and Qt read.
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  
  # Cursor theme (single owner)

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = true;
    x11.enable = true;
  };
  
  # Qt theming (declarative, no qt6ct)
  # Make Qt follow GTK/portal without manual tools.

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };
  
  # Session variables (theme-relevant only)
  # These are FALLBACKS, not overrides.

  home.sessionVariables = {
    # Helps older Qt apps stay in sync with GTK
    QT_QPA_PLATFORMTHEME = "gtk3";
  };

  
  # Packages required by the theme
  home.packages = with pkgs; [
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
    adwaita-icon-theme
  ];
}
