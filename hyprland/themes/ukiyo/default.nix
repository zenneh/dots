{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland.extraConfig = import ./hyprland.conf;
}