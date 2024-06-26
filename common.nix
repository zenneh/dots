{ pkgs, config, ... }:
{
  imports = [
    # Terminal configurations
    ./helix
    ./kitty
    ./zsh
    ./tmux
    ./starship
    ./wezterm
    ./alacritty
    ./dwm
    ./broot
    ./newsboat

    # Graphical application configurations
    ./firefox
    ./chromium
    
    # Service configurations
    ./dunst
    ./gtklock

    # Theme configurations
    ./gtk
    ./qt

    # Screenshot
    ./flameshot
    # Sreenrecord
    ./ffmpeg

    # Pdf reader
    ./zathura

    # Editor
    # ./vscode
   ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    bluez # bluetooth manager
    dict # Translation dictionary
    dunst # Notification manager
    gnome.dconf-editor # to find gnome keybinds
    gnome.gnome-tweaks
    gnome.nautilus nautilus-open-any-terminal # nautilus + open different terminals with nautilus
    gnome.zenity # Gnome dialog tool
    jq # JSON parsing
    killall # Kill services
    kitty # Terminal
    libnotify
    niv # Dependency management for nix projects (fix npm bug)
    pamixer
    pavucontrol
    playerctl
    rm-improved # rip: alternative to rm (https://github.com/nivekuil/rip)
    xorg.xkill

    # FONTS
    nerdfonts

    # ICONS
    papirus-icon-theme
  ];

  # Font for bar
  fonts = {
    fontconfig = {
      enable = true;
    };
  };
}
