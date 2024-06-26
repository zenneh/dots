{ pkgs, ... }:
let 
  hyprPath = "~/dots/hyprland";
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    # example binds
    bindm=SUPER,mouse:272,movewindow
    bindm=SUPER,mouse:273,resizewindow

    # basic keybinds
    bind=SUPER,Q,killactive,
    bind=SUPERCTRL,M,exit,
    bind=SUPER,S,togglefloating,
    bind=SUPERCTRL,D,pin
    bind=SUPER,space,exec,anyrun
    bind=SUPERCTRL,S,pseudo,
    bind=SUPER,A,exec,hyprctl dispatch fullscreen 1

    # Screenshotting
    bind=,Print,exec,${hyprPath}/config/scripts/screenshot selection
    bind=CTRL,Print,exec,${hyprPath}/config/scripts/screenshot full_screen
    bind=ALT,Print,exec,${hyprPath}/config/scripts/screenshot delay
    bind=SUPER,Print,exec,${hyprPath}/config/scripts/record_screen

    # basic applications
    bind=SUPER,E,exec,nautilus

    # Kitty
    bind=SUPER,T,exec,kitty --single-instance
    bind=SUPERSHIFT,T,exec,hyprctl dispatch exec '[float; center; size 65% 65%; center 1] kitty'

    # Workspaces
    bind=SUPERSHIFT, H, workspace, 1
    bind=SUPERSHIFT, J, workspace, 2
    bind=SUPERSHIFT, K, workspace, 3
    bind=SUPERSHIFT, L, workspace, 4
    bind=SUPERSHIFT, U, workspace, 5
    bind=SUPERSHIFT, I, workspace, 6
    bind=SUPERSHIFT, O, workspace, 7
    bind=SUPERSHIFT, P, workspace, 8

    # Tools
    # bind=SUPER,V,exec,cliphist list | anyrun | cliphist decode | wl-copy
    bind=SUPER,V,exec,hyprctl dispatch exec '[float] copyq toggle'


    # running personal applications
    bind=SUPER,F,exec,firefox

    # lock screen
    bind=SUPERALT_L,L,exec,${hyprPath}/config/scripts/lock
    
    # Wallpaper
    bind=SUPER,B,exec,${hyprPath}/config/scripts/wallpaper/wallpaper_picker

    ### binds for workspaces ###
    ## focusing windows
    bind=SUPER,h,movefocus,l
    bind=SUPER,l,movefocus,r
    bind=SUPER,k,movefocus,u
    bind=SUPER,j,movefocus,d

    ## moving windows
    bind=SUPERCTRL,h,movewindow,l
    bind=SUPERCTRL,l,movewindow,r
    bind=SUPERCTRL,k,movewindow,u
    bind=SUPERCTRL,j,movewindow,d

    ## swapping windows
    bind=SUPERCTRLSHIFT,h,swapwindow,l
    bind=SUPERCTRLSHIFT,l,swapwindow,r
    bind=SUPERCTRLSHIFT,k,swapwindow,u
    bind=SUPERCTRLSHIFT,j,swapwindow,d

    ## swap between horizontal/vertical splitting
    bind=SUPER,z,layoutmsg,togglesplit
    
    # moving to other wokspace with mouse control
    bind=SUPER,mouse_down,workspace,e-1
    bind=SUPER,mouse_up,workspace,e+1

    # group control
    bind=SUPER,g,togglegroup
    bind=SUPER,tab,changegroupactive

    # kitty binds
    bind=SUPERCTRL,1,exec,kitty --title fly_is_kitty --hold cava
    bind=SUPERCTRL,2,exec,code-insiders
    bind=SUPERCTRL,3,exec,kitty --single-instance --hold donut.c
    bind=SUPERCTRL,4,exec,kitty --title clock_is_kitty --hold tty-clock -C5

    # Audio
    bind=,XF86AudioPlay,exec,playerctl play-pause
    bind=,XF86AudioPrev,exec,playerctl previous
    bind=,XF86AudioNext,exec,playerctl next

    bindl=,XF86AudioMedia,exec,playerctl play-pause
    bindl=,XF86AudioStop,exec,playerctl stop

    bindle=,XF86AudioRaiseVolume,exec,~/nixos/home/dots/services/dunst/scripts/volume/volume.sh up
    bindle=,XF86AudioLowerVolume,exec,~/nixos/home/dots/services/dunst/scripts/volume/volume.sh down
    bindle=,XF86AudioMute,exec,~/nixos/home/dots/services/dunst/scripts/volume/volume.sh mute
    # brightness
    bindle=,XF86MonBrightnessUp,exec,~/nixos/home/dots/services/dunst/scripts/brightness/brightness.sh up
    bindle=,XF86MonBrightnessDown,exec,~/nixos/home/dots/services/dunst/scripts/brightness/brightness.sh down
    bind=,XF86Calculator,exec,qalculate

    # Lid open/close
    # trigger when the switch is toggled
    # bindl=,switch:Lid Switch,exec,swaylock -c000000
    # trigger when the switch is turning on
    bindl=,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1, 2560x1600, 0x0, 1"
    # trigger when the switch is turning off
    bindl=,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"

    ## workspaces
    # focusing other workspaces
    bind=SUPER,1,exec, ${hyprPath}/config/scripts/workspace visit 1
    bind=SUPER,2,exec, ${hyprPath}/config/scripts/workspace visit 2
    bind=SUPER,3,exec, ${hyprPath}/config/scripts/workspace visit 3
    bind=SUPER,4,exec, ${hyprPath}/config/scripts/workspace visit 4
    bind=SUPER,5,exec, ${hyprPath}/config/scripts/workspace visit 5
    bind=SUPER,6,exec, ${hyprPath}/config/scripts/workspace visit 6
    bind=SUPER,7,exec, ${hyprPath}/config/scripts/workspace visit 7
    bind=SUPER,8,exec, ${hyprPath}/config/scripts/workspace visit 8
    bind=SUPER,9,exec, ${hyprPath}/config/scripts/workspace visit 9
    bind=SUPER,0,exec, ${hyprPath}/config/scripts/workspace visit 10

    # focusing other workspaces
    # moving windows to other workspaces
    bind=ALT_L,1,exec, ${hyprPath}/config/scripts/workspace move 1
    bind=ALT_L,2,exec, ${hyprPath}/config/scripts/workspace move 2
    bind=ALT_L,3,exec, ${hyprPath}/config/scripts/workspace move 3
    bind=ALT_L,4,exec, ${hyprPath}/config/scripts/workspace move 4
    bind=ALT_L,5,exec, ${hyprPath}/config/scripts/workspace move 5
    bind=ALT_L,6,exec, ${hyprPath}/config/scripts/workspace move 6
    bind=ALT_L,7,exec, ${hyprPath}/config/scripts/workspace move 7
    bind=ALT_L,8,exec, ${hyprPath}/config/scripts/workspace move 8
    bind=ALT_L,9,exec, ${hyprPath}/config/scripts/workspace move 9
    bind=ALT_L,0,exec, ${hyprPath}/config/scripts/workspace move 10

    # moving windows to other workspaces (silent)
    bind=SUPERALT_L,1,exec, ${hyprPath}/config/scripts/workspace movesilent 1
    bind=SUPERALT_L,2,exec, ${hyprPath}/config/scripts/workspace movesilent 2
    bind=SUPERALT_L,3,exec, ${hyprPath}/config/scripts/workspace movesilent 3
    bind=SUPERALT_L,4,exec, ${hyprPath}/config/scripts/workspace movesilent 4
    bind=SUPERALT_L,5,exec, ${hyprPath}/config/scripts/workspace movesilent 5
    bind=SUPERALT_L,6,exec, ${hyprPath}/config/scripts/workspace movesilent 6
    bind=SUPERALT_L,7,exec, ${hyprPath}/config/scripts/workspace movesilent 7
    bind=SUPERALT_L,8,exec, ${hyprPath}/config/scripts/workspace movesilent 8
    bind=SUPERALT_L,9,exec, ${hyprPath}/config/scripts/workspace movesilent 9
    bind=SUPERALT_L,0,exec, ${hyprPath}/config/scripts/workspace movesilent 10
  '';
}
