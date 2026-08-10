{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nix.optimise.automatic = true;
  nix.optimise.dates = [ "weekly" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.fstrim.enable = true;
  services.lact.enable = true;
  services.flatpak.enable = true; # spotify sober

}
