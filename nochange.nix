{ config, pkgs, ... }:
{

system.stateVersion = "25.11";

nixpkgs.config.allowUnfree = true;

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
services.displayManager.plasma-login-manager.enable = true;
services.displayManager.autoLogin = {
	enable = true;
	user = "andre1ka";
};
services.lact.enable = true;
services.flatpak.enable = true;
services.fstrim.enable = true;

services.ananicy = {
  enable = true;
  package = pkgs.ananicy-cpp;
};
services.journald.extraConfig = ''
  SystemMaxUse=100M
  MaxFileSec=7day
'';
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.initrd.kernelModules = [ "amdgpu" ];
boot.initrd.availableKernelModules = [ "amdgpu" ];
boot.plymouth.enable = true;
boot.loader.systemd-boot.consoleMode = "max";

networking.firewall.enable = true;


hardware.graphics = {
  enable = true;
  enable32Bit = true;
};

boot.tmp.useTmpfs = true;

hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
};

hardware.cpu.amd.updateMicrocode = true;

zramSwap = {
  enable = true;
  algorithm = "zstd";
  memoryPercent = 50;  # 16 GB
};

programs.fish.shellAliases = {
  ls = "eza --icons";
  ll = "eza -l --icons --git";
  cat = "bat"; # если решишь поставить пакет bat (замена cat с подсветкой синтаксиса)
};

nix.settings.auto-optimise-store = true;
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 7d";
};

fileSystems."/mnt/sdb" = {
	device  = "/dev/disk/by-uuid/54e18046-08b5-418f-bbfc-441867dd1f64";
	fsType  = "ext4";
	options = [ "defaults" "nofail" "x-gvfs-show" "noatime" "lazytime" "commit=60" ];
};

nix.settings.experimental-features = [ "nix-command" "flakes" ];

}
