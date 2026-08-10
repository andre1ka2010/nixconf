{ config, pkgs, ... }:
{
  hardware.amdgpu.initrd.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };
  powerManagement.cpuFreqGovernor = "performance";
}
