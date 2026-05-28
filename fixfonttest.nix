{ config, pkgs, ... }:
{
  fonts.enableDefaultPackages = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    dejavu_fonts
  ];

  fonts.fontconfig = {
    enable = true;
    antialias = true;
    hinting = {
      enable = true;
      style = "slight";
    };
    subpixel = {
      rgba = "rgb";
    };
    # lcdfilter удалён — его нет в 26.05

    defaultFonts = {
      serif     = [ "Noto Serif" "DejaVu Serif" ];
      sansSerif = [ "Noto Sans" "DejaVu Sans" ];
      monospace = [ "JetBrainsMono Nerd Font" "DejaVu Sans Mono" ];
      emoji     = [ "Noto Color Emoji" ];
    };
  };
services.xserver.displayManager.sessionCommands = ''
  echo "QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor" >> ~/.config/environment.d/kde-fix.conf
'';

}


