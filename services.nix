{ config, pkgs, ... }:
{
services.fstrim.enable = true;

systemd.services.lactd = {
  description = "AMDGPU Control Daemon";
  enable = true;
  serviceConfig = {
    ExecStart = "${pkgs.lact}/bin/lact daemon";
  };
  wantedBy = [ "multi-user.target" ];
};

services.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
	jack.enable = true;
	#media-session.enable = true;
  };

virtualisation.libvirtd = {
  enable = true;
};

virtualisation.spiceUSBRedirection.enable = true;

services.flatpak.enable = true;

services.displayManager.plasma-login-manager.enable = true;
services.displayManager.autoLogin = {
	enable = true;
	user = "andre1ka";
};
services.desktopManager.plasma6.enable = true;

networking.networkmanager.enable = true;

nix.settings.auto-optimise-store = true;
nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 7d";
};

hardware.bluetooth = {
	enable = true;
	powerOnBoot = true;
};

zramSwap.enable = true;
zramSwap.algorithm = "zstd";
boot.kernel.sysctl."vm.swappiness" = 10;
 }

