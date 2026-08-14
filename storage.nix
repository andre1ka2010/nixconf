{ config, pkgs, ... }:
{
  fileSystems."/mnt/sdb" = {
    device = "/dev/disk/by-uuid/84a94194-24d5-4f8c-a954-fea16aa08558";
    fsType = "ext4";
    options = [ "noatime" "nofail" ];
  };
}
