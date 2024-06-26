{ config, pkgs, ... }:

{ 
  home.packages = with pkgs; [
    cliphist
    dart-sass
    gtklock
    grim # Screenshots
    hyprpicker
    networkmanagerapplet
    socat
    slurp # Screencoordinates for selected area
    swappy # Screenshot editor
    swww
    wdisplays
    wf-recorder
    wl-clip-persist
    wl-clipboard
    wofi
    xorg.xhost # fix gparted not starting (and perhaps other apps aswell)
    hyprland-autoname-workspaces
  ];

  # Create config for the hyprland autoname packages
  xdg.configFile."hyprland_autoname_workspaces.toml".source = ./config/conf/hyprland-autoname-workspaces.toml;
  services.copyq.enable = true; 
}
