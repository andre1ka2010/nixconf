{ config, pkgs, ... }:
{

system.stateVersion = "25.11";
nixpkgs.config.allowUnfree = true;
networking.networkmanager.enable = true;
time.timeZone = "Europe/Kyiv";
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
  LC_ADDRESS = "uk_UA.UTF-8";
  LC_IDENTIFICATION = "uk_UA.UTF-8";
  LC_MEASUREMENT = "uk_UA.UTF-8";
  LC_MONETARY = "uk_UA.UTF-8";
  LC_NAME = "uk_UA.UTF-8";
  LC_NUMERIC = "uk_UA.UTF-8";
  LC_PAPER = "uk_UA.UTF-8";
  LC_TELEPHONE = "uk_UA.UTF-8";
  LC_TIME = "uk_UA.UTF-8";
};
services.desktopManager.plasma6.enable = true;
networking.hostName = "nix";
services.flatpak.enable = true;
services.fstrim.enable = true;
services.lact.enable = true;
services.displayManager.plasma-login-manager.enable = true;
services.displayManager.autoLogin = {
	enable = true;
	user = "evoq";
};
boot.tmp.useTmpfs = true;
fileSystems."/mnt/sdb" = {
	device  = "/dev/disk/by-uuid/692bdaaf-cd2d-4fa5-ae0d-9512f07b1833";
	fsType  = "ext4";
	options = [ "defaults" "nofail" "x-gvfs-show" "noatime" ];
};
hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
};

nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 7d";
};

hardware.cpu.amd.updateMicrocode = true;
zramSwap = {
  enable = true;
  algorithm = "zstd";
  memoryPercent = 25;  # 8 GB
};

}
