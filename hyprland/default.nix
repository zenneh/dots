{ config, pkgs, ...}:

{
  imports = [
    ./config
    ./dependencies.nix
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };
}
