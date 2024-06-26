{ config, pkgs, ... }:


{
  home.packages = with pkgs; [
    round
    # hyprland-autoname-workspaces
    (callPackage ./hyprland-workspaces.nix {})
    (callPackage ./hyprland-activewindow.nix {})
  ];

  programs.eww = {
    enable = true;
    configDir = ./themes/ukiyo;
    package = pkgs.eww-wayland;

    # "hyprland/workspaces" = {
    #   "format" = "{name}";
    # };

  };
}
