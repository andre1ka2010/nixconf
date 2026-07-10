{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
  #"quiet"
  #"splash"
  "amd_pstate=active"
  "btusb.enable_autosuspend=0"
  #"amdgpu.ppfeaturemask=0xffffffff"
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

  services.xserver.enable = false;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.desktopManager.plasma6.enable = true;
  
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session";
        user = "greeter";
      };
    };
  };




  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.pulseaudio.enable = false;
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
    description = "User";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "input" "video" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  programs.obs-studio.enable = true;
  programs.steam.enable = true;
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

  environment.systemPackages = with pkgs; [

    # --GUI--
    kitty
    kdePackages.kate
    kdePackages.ksystemlog
    prismlauncher
    easyeffects
    telegram-desktop
    haruna
    mission-center
    goverlay
    mangohud
    discord

    # --CLI--
    zip
    unzip
    unrar
    fastfetch
    git
    curl
    wget
    p7zip

  ];

  fonts = {
    packages = with pkgs; [
      noto-fonts
      jetbrains-mono
      terminus_font
    ];
  };

  hardware.cpu.amd.updateMicrocode = true;
  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  };

  services.fstrim.enable = true;
  services.lact.enable = true;
  services.flatpak.enable = true; # spotify

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 25;
  };

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 25565 ];
  networking.firewall.allowedUDPPorts = [ 25565 ];

  system.stateVersion = "26.05";

}
