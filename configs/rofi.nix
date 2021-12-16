{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    plugins = with pkgs; [
      rofi-systemd
      rofi-power-menu
      rofi-emoji
    ];
    font = "Iosevka Medium 14";
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = "gruvbox-dark";
    extraConfig = {
      modi = "window,drun,ssh,emoji,keys,filebrowser,windowcd";
    };
  };
}
