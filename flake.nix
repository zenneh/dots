{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    # all common components
    common = ./common.nix;

    # compositor's, wm's, de's
    hyprland = {
      hyprland = ./hyprland;
      keybindsQwerty = ./hyprland/config/keybinds.nix;
      monitors = ./hyprland/config/monitors.nix;
      themes = {
        ukiyo = ./hyprland/themes/ukiyo;
      };
    };

    i3 = {
      i3 = ./i3;
    };

    eww = {
      eww = ./eww;
    };
    
    # gnome = ./graphical/gnome/default.nix;

    # apps
    firefox = ./firefox;

    # launchers
    # wofi = ./graphical/launchers/wofi;
    anyrun = ./anyrun;
    
    # services
    dunst = ./dunst;
    gtklock = ./gtklock;
    swayidle = ./swayidle;

  };
}

