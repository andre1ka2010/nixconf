{ config, pkgs, ... }:
{
imports = [
    ./hardware-configuration.nix
    ./apps.nix
    ./services.nix
    ./automount.nix
  ];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelParams = [ "quiet" "splash" "btusb.enable_autosuspend=n" "amd_pstate=active" "amdgpu.ppfeaturemask=0xffffffff"];  

networking.hostName = "nixdesktop";

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

users.users.andre1ka = {
	isNormalUser = true;
	description = "Andrii Haliev";
	extraGroups = [ "networkmanager" "wheel" "gamemode" "storage" "input" "libvirtd" "kvm"];
	shell = pkgs.fish;
	packages = with pkgs; [
		kdePackages.kate
	];
};



boot.tmp.useTmpfs = true;

system.stateVersion = "25.11";
}
