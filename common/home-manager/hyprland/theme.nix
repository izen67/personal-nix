{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    # GTK4 / libadwaita: dark mode ONLY
    colorScheme = "dark";

    # GTK3 only
    theme = {
      name = "Kanagawa-BL-LB-Dark-Dragon";
      package = pkgs.kanagawa-gtk-theme;
    };

    iconTheme = {
      name = "Kora-Dark";
      package = pkgs.kora-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "kanagawa-gtk-theme";
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
}
