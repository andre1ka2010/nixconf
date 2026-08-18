{ config, pkgs, ... }:
{
  fileSystems."/mnt/sata1000" = {
    device = "/dev/disk/by-uuid/98e42b06-2ce3-4497-9008-13e74d44dbc4";
    fsType = "ext4";
    options = [ "noatime" "nofail" ];
  };
}
