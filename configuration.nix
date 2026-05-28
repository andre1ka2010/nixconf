{ config, pkgs, ... }:
{
imports = [
  ./hardware-configuration.nix
  ./nochange.nix
  ./fixfonttest.nix
];

boot.kernelParams = [ "loglevel=4" "splash" "quiet" "nowatchdog" "btusb.enable_autosuspend=n" "amd_pstate=active" "amdgpu.ppfeaturemask=0xffffffff" "split_lock_detect=off"];
boot.kernelPackages = pkgs.linuxPackages_zen;
boot.plymouth.theme = "bgrt";
boot.initrd.verbose = false;

networking.hostName = "nixos";

networking.networkmanager.enable = true;

services.pipewire.jack.enable = true;
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

users.users.andre1ka = {
  isNormalUser = true;
  description = "andre1ka";
  shell = pkgs.fish;
  extraGroups = [ "networkmanager" "wheel" "input" "gamemode" "storage"];
  packages = with pkgs; [
    kdePackages.kate
  ];
};

programs.firefox.enable = true;
programs.kdeconnect.enable = true;
programs.gamemode.enable = true;
programs.fish.enable = true;
programs.steam.enable = true;
programs.gamescope.enable = true;
programs.obs-studio.enable = true;
networking.firewall.allowedTCPPorts = [ 25565 ];
networking.firewall.allowedUDPPorts = [ 25565 ];

environment.systemPackages = with pkgs; [
mangohud
mission-center
wget
curl
git
zip
unzip
lact
unrar
p7zip
cava
fastfetch
easyeffects
haruna
kitty
prismlauncher
vesktop
telegram-desktop
libreoffice-qt6-fresh
eza
bat
];

}
