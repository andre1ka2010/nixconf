{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 4;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.consoleMode = "keep";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "amdgpu.ppfeaturemask=0xffffffff"
    #"quiet"
    #"splash"
    "amd_pstate=active"
    "btusb.enable_autosuspend=0"
  ];

  boot.tmp.useTmpfs = true;
}
