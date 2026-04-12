{config, pkgs, ... }:
{

fileSystems."/mnt/sdb" = {
	device  = "/dev/disk/by-uuid/692bdaaf-cd2d-4fa5-ae0d-9512f07b1833";
	fsType  = "ext4";
	options = [ "defaults" "nofail" "x-gvfs-show" ];
};

}
