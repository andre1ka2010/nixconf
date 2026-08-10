{ config, pkgs, ... }:
{
  # --- Programs: софт со своим NixOS-модулем (programs.<name>.enable) ---
  # проверяется на search.nixos.org — если модуль есть, он тащит доп.
  # интеграцию (systemd-юниты, конфиги, группы), а не просто ставит бинарник
  programs.obs-studio.enable = true;
  programs.gamemode.enable = true;
  programs.kdeconnect.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.steam = {
    enable = true;
    localNetworkGameTransfers.openFirewall = true;
    remotePlay.openFirewall = true;
  };

  programs.fish.shellAliases = {
    nixconf = "sudo nano /etc/nixos/configuration.nix";
    rebuild = "sudo nixos-rebuild switch";
    rebuildgrade = "sudo nixos-rebuild switch --upgrade";
    rebuildboot = "sudo nixos-rebuild boot";
    rebuildbootgrade = "sudo nixos-rebuild boot --upgrade";
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
