{ config, pkgs, ... }:
{
  services.displayManager.plasma-login-manager.enable = true;
  services.desktopManager.plasma6.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config = {
      common = {
        default = [ "kde" ];
      };
    };
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.obs-studio.enable = true;
  programs.gamemode.enable = true;
  programs.kdeconnect.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.fish.shellAliases = {
    nixconf = "sudo nano /etc/nixos/configuration.nix";
    rebuild = "sudo nixos-rebuild switch";
    rebuildgrade = "sudo nixos-rebuild switch --upgrade";
    rebuildboot = "sudo nixos-rebuild boot";
    rebuildbootgrade = "sudo nixos-rebuild boot --upgrade";
  };
  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
  };


  environment.systemPackages = with pkgs; [
    # --GUI--
    kdePackages.kate
    kdePackages.ksystemlog
    prismlauncher
    easyeffects
    telegram-desktop
    haruna
    mangohud
    proton-vpn
    discord
    mission-center
    qbittorrent
    kitty
    kdePackages.filelight

    # --CLI--
    zip
    unzip
    p7zip
    unrar
    fastfetch
    git
    curl
    wget
    jdk25
    htop

  ];

  # --- Шрифты ---
  fonts.packages = with pkgs; [
    noto-fonts
    maple-mono.variable
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
  ];
}
