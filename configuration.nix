{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/hardware.nix
    ./modules/network-locale.nix
    ./modules/users.nix
    ./modules/progs-n-de.nix
    ./modules/nix-n-services.nix
    ./modules/storage.nix
    ./modules/plasma-lag-fix.nix
  ];

  system.stateVersion = "26.05";
}
