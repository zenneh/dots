{ pkgs, ... }:
{
  wayland.windowManager.hyprland.extraConfig = ''
    source = ~/dots/hyprland/config/conf/monitors.conf
  '';
}