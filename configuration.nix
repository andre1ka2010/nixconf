
{ config, pkgs, ... }:
{

imports =
[
  ./hardware-configuration.nix
  ./willnotchange.nix
  ./testing.nix
];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.kernelParams = [ "loglevel=4" "nowatchdog" "btusb.enable_autosuspend=n" "amd_pstate=active" "amdgpu.ppfeaturemask=0xffffffff"];

boot.kernelPackages = pkgs.linuxPackages_latest;

services.pipewire.jack.enable = true;
services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
  enable = true;
  alsa.enable = true;
  alsa.support32Bit = true;
  pulse.enable = true;
};

users.users.evoq = {
  isNormalUser = true;
  description = "Andrii Haliev";
  extraGroups = [ "networkmanager" "wheel" "input" "gamemode" "storage"];
  shell = pkgs.fish;
  packages = with pkgs; [
     kdePackages.kate
  ];
};

programs.firefox.enable = true;
programs.kdeconnect.enable = true;
programs.gamemode.enable = true;
programs.fish.enable = true;
programs.steam.enable = true;

environment.systemPackages = with pkgs; [
  mangohud
  wget
  curl
  git
  vim
  zip
  unzip
  unrar
  p7zip
  cava
  fastfetch
  nerd-fonts.jetbrains-mono
  lact
  obs-studio
  easyeffects
  haruna
  kitty
  goverlay
  prismlauncher
  vesktop
  telegram-desktop
  libreoffice-qt6-fresh
  javaPackages.compiler.temurin-bin.jdk-25
];

networking.firewall.allowedTCPPorts = [ 25565 ];
networking.firewall.allowedUDPPorts = [ 25565 ];
networking.firewall.enable = true;

}
