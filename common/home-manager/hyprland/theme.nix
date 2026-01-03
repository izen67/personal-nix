{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    # Global GTK dark mode (GTK2 / GTK3 / GTK4)
    colorScheme = "dark";
    # GTK2 / GTK3 theme (GTK4 uses color-scheme, not theming)
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    # Icons for all GTK versions
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    # Cursor theme for GTK
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };

  # dconf is used only for settings not fully abstracted by HM
  # and for non-GTK consumers (portals, Electron, Qt integration)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Cursor for non-GTK consumers (XWayland, misc toolkits)
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = false;
    x11.enable = true;
  };

  # Qt theming, fully HM-managed, no qt5ct/qt6ct
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "breeze";
      package = pkgs.kdePackages.breeze;
    };
  };

  # Theme assets required by the configuration
  home.packages = with pkgs; [
    adw-gtk3
    papirus-icon-theme
    bibata-cursors
    adwaita-icon-theme
    adwaita-qt
    kdePackages.breeze
  ];
}
