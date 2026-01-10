{ config, ... }:

{
  fileSystems."/mnt/sambazm" = {
    device = "//192.168.50.102/zoneminder";
    fsType = "cifs";
    options = [
      "username=sambazm"
      "password=sambazm"
      "uid=1000"
      "gid=100"
      "noatime"
      "x-systemd.automount"
      "x-systemd.idle-timeout=60"
    ];
  };

fileSystems."/mnt/media" = {
  device = "192.168.50.101:/MEDIA";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/media2" = {
  device = "192.168.50.101:/MEDIA2";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/filebrowser" = {
  device = "192.168.50.101:/OPENCLOUD";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/audiobookshelf" = {
  device = "192.168.50.101:/AUDIOBOOKSHELF";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

fileSystems."/mnt/torrent" = {
  device = "192.168.50.101:/TORRENT";
  fsType = "nfs";
  options = [
    "_netdev"
    "noatime"
    "x-systemd.automount"
  ];
};

}
