{ config, pkgs, ... }:
{
  users.users."andrii" = {
    isNormalUser = true;
    description = "Andrii Haliev";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "input" "video" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };
}
