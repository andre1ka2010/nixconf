{ config, pkgs, ... }:
{

nixpkgs.config.allowUnfree = true;

hardware.graphics = {
	enable = true;
	enable32Bit = true;
	extraPackages = with pkgs; [
		rocmPackages.clr.icd
		libva-utils
		libva-vdpau-driver
		libvdpau-va-gl
	];
};

boot.kernelPackages = pkgs.linuxPackages_zen;

programs.kdeconnect.enable = true;
programs.steam.enable = true;
programs.firefox.enable = true;
programs.gamemode.enable = true;
programs.fish.enable = true;
virtualisation.vmware.host.enable = true;

environment.systemPackages = with pkgs; [
	obsidian
	kdePackages.ksystemlog
	kdePackages.filelight
	obs-studio
	kdePackages.kolourpaint
	kdePackages.kdenlive
	gparted-full
	git
	qbittorrent
	proton-vpn
	wineWow64Packages.waylandFull
	lact
	javaPackages.compiler.temurin-bin.jdk-25
	micro
	mangohud
	fastfetch
	cava
	kdePackages.dolphin-plugins
	ayugram-desktop
	discord
	kdePackages.ark
	unzip
	zip
	unrar
	p7zip
	libreoffice-qt6-fresh
	goverlay
	prismlauncher
	easyeffects
  ];

 }
