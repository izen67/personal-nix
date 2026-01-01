{ config, ... }:

{
  fileSystems."/mnt/sambazm" = {
    device = "//192.168.50.53/zoneminder";
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
}
