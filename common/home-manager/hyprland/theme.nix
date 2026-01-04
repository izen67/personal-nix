{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    colorScheme = "dark";

    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "adwaita-dark";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    size = 24;
    package = pkgs.bibata-cursors;
    gtk.enable = false;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    kdePackages.breeze
  ];
}
