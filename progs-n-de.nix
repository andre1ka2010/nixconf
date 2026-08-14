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

  # --- Programs: софт со своим NixOS-модулем (programs.<name>.enable) ---
  # проверяется на search.nixos.org — если модуль есть, он тащит доп.
  # интеграцию (systemd-юниты, конфиги, группы), а не просто ставит бинарник
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
  };



  # --- Packages: всё остальное, без отдельного programs.<name> ---
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
    jetbrains-mono
    maple-mono.variable
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
  ];
}
