{ config, lib, pkgs, ... }:
let 
  mod = "Mod4";
  alt = "Mod1";
  workspace = "~/dots/i3/workspace.sh";
in {
  home.packages = with pkgs; [
    arandr
    feh
    flameshot # Screenshots
    gcolor3
    rofi
    xclip
    xcolor
    xidlehook
  ];
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = mod;

      terminal = "kitty";
      keybindings = {
        # Very important
        "${mod}+space" = "exec ${pkgs.dmenu}/bin/dmenu_run";

        # Applications
        "${mod}+Control+m" = "exit";
        "${mod}+t" = "exec kitty";
        "${alt}+Control+t" = "exec wezterm";
        "${mod}+f" = "exec firefox";
        "${mod}+e" = "exec nautilus";
        
        # i3 stuff
        "${mod}+q" = "kill";
        "--release ${mod}+Control+q" = "exec xkill"; # Doesn't work without `--release`
        "${mod}+a" = "fullscreen toggle";
        "${mod}+s" = "floating toggle";
        "${mod}+Control+s" = "exec i3-msg exit";
        "${mod}+z" = "layout toggle split";
        "${mod}+v" = "splitv";
        "${mod}+h" = "splith";

        # Focus
        "${mod}+Left" =  "focus left";
        "${mod}+Down" =  "focus down";
        "${mod}+Up" =    "focus up";
        "${mod}+Right" = "focus right";

        # Move
        "${mod}+Control+Left" =  "move left";
        "${mod}+Control+Down" =  "move down";
        "${mod}+Control+Up" =    "move up";
        "${mod}+Control+Right" = "move right";
        
        # Resize Grow
        "${mod}+Shift+Left" =  "resize grow left  40 px or 3 ppt";
        "${mod}+Shift+Down" =  "resize grow down  40 px or 3 ppt";
        "${mod}+Shift+Up" =    "resize grow up    40 px or 3 ppt";
        "${mod}+Shift+Right" = "resize grow right 40 px or 3 ppt";

        # Resize Shrink
        "${mod}+Control+Shift+Left" =  "resize shrink right   40 px or 3 ppt";
        "${mod}+Control+Shift+Down" =  "resize shrink up      40 px or 3 ppt";
        "${mod}+Control+Shift+Up" =    "resize shrink down    40 px or 3 ppt";
        "${mod}+Control+Shift+Right" = "resize shrink left    40 px or 3 ppt";

        # switch to workspace
        "${mod}+1" = "exec ${workspace} visit 1";
        "${mod}+2" = "exec ${workspace} visit 2";
        "${mod}+3" = "exec ${workspace} visit 3";
        "${mod}+4" = "exec ${workspace} visit 4";
        "${mod}+5" = "exec ${workspace} visit 5";
        "${mod}+6" = "exec ${workspace} visit 6";
        "${mod}+7" = "exec ${workspace} visit 7";
        "${mod}+8" = "exec ${workspace} visit 8";
        "${mod}+9" = "exec ${workspace} visit 9";
        "${mod}+0" = "exec ${workspace} visit 0";

        # move focused container to workspace
        "${alt}+1" = "exec ${workspace} move 1";
        "${alt}+2" = "exec ${workspace} move 2";
        "${alt}+3" = "exec ${workspace} move 3";
        "${alt}+4" = "exec ${workspace} move 4";
        "${alt}+5" = "exec ${workspace} move 5";
        "${alt}+6" = "exec ${workspace} move 6";
        "${alt}+7" = "exec ${workspace} move 7";
        "${alt}+8" = "exec ${workspace} move 8";
        "${alt}+9" = "exec ${workspace} move 9";
        "${alt}+0" = "exec ${workspace} move 0";

        # move focused container silently
        "${mod}+${alt}+1" = "exec ${workspace} movesilent 1";
        "${mod}+${alt}+2" = "exec ${workspace} movesilent 2";
        "${mod}+${alt}+3" = "exec ${workspace} movesilent 3";
        "${mod}+${alt}+4" = "exec ${workspace} movesilent 4";
        "${mod}+${alt}+5" = "exec ${workspace} movesilent 5";
        "${mod}+${alt}+6" = "exec ${workspace} movesilent 6";
        "${mod}+${alt}+7" = "exec ${workspace} movesilent 7";
        "${mod}+${alt}+8" = "exec ${workspace} movesilent 8";
        "${mod}+${alt}+9" = "exec ${workspace} movesilent 9";
        "${mod}+${alt}+0" = "exec ${workspace} movesilent 0";
      };
      startup = [
          # Key repeat delay (src: https://jaketrent.com/post/adjust-keyboard-repeat-rate-i3/)
          {
            command = "xset r rate 250 35";
            always = false;
            notification = false;
          }
          {
            command = "setxkbmap -option caps:escape";
            always = false;
          }
      ];
    };
  };
}
