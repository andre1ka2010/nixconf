{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./plasma-lag-fix.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.consoleMode = "max";
  boot.kernelParams = [
  "amdgpu.ppfeaturemask=0xffffffff"
  #"quiet"
  #"splash"
  "amd_pstate=active"
  "btusb.enable_autosuspend=0"
  ];


  networking.hostName = "hmmilyall";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };
  
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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
  };

  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "input" "video" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

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
  startplasma = "startplasma-wayland";
  };

  environment.systemPackages = with pkgs; [

    # --GUI--
    kitty
    kdePackages.kate
    kdePackages.ksystemlog
    prismlauncher
    easyeffects
    telegram-desktop
    haruna
    goverlay
    mangohud
    discord

    # --CLI--
    zip
    unzip
    unrar
    fastfetch
    fetch
    git
    curl
    wget
    p7zip
    android-tools
    scrcpy
    jdk25
    micro
  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts
      jetbrains-mono
      terminus_font
      maple-mono.variable
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
    ];
  };

  hardware.amdgpu.initrd.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  };
  
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "weekly" ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.fstrim.enable = true;
  services.lact.enable = true;
  services.flatpak.enable = true; # spotify

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };


  networking.firewall = {
  enable = true;
  allowedTCPPorts = [ 25565 ];
  allowedUDPPorts = [ ];
};

  system.stateVersion = "26.05";

}
