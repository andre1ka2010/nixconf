{ config, pkgs, ... }:
{
  fileSystems."/mnt/sdb" = {
    device = "/dev/disk/by-uuid/84a94194-24d5-4f8c-a954-fea16aa08558";
    fsType = "ext4";
    options = [ "noatime" "nofail" ];
  };

  fileSystems."/mnt/sda" = {
    device = "/dev/disk/by-uuid/d7300ef2-814a-43f3-b33a-bb98fc25d887";
    fsType = "ext4";
    options = [ "noatime" "nofail" ];
};
}
