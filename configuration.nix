{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/hardware.nix
    ./modules/network-locale.nix
    ./modules/desktop-environment.nix
    ./modules/users.nix
    ./modules/software.nix
    ./modules/nix-n-services.nix
    ./modules/storage.nix
    ./modules/plasma-lag-fix.nix
  ];

  system.stateVersion = "26.05";
}
