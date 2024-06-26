{ pkgs, config, ... }:
{
  programs.kitty = {
    enable = true;
    settings = import ./settings.nix;
    keybindings = {
      "ctrl+shift+return" =  "no_op"; # we want to use this for new line in helix
      "ctrl+return"  =  "no_op"; # we want to use this for new line in helix
      "ctrl+shift+n" = "launch --cwd=current --location=hsplit";
      "ctrl+alt+n"   = "launch --cwd=current --location=vsplit";
      "ctrl+shift+q" = "close_window";

      # focus
      "ctrl+shift+h"  = "neighboring_window left";
      "ctrl+shift+l" = "neighboring_window right";
      "ctrl+shift+k"    = "neighboring_window up";
      "ctrl+shift+j"  = "neighboring_window down";

      # move
      "ctrl+shift+alt+h"  = "move_window left";
      "ctrl+shift+alt+l" = "move_window right";
      "ctrl+shift+alt+k"    = "move_window up";
      "ctrl+shift+alt+j"  = "move_window down";

      # resize
      "ctrl+alt+h"  = "resize_window narrower";
      "ctrl+alt+l" = "resize_window wider";
      "ctrl+alt+k"    = "resize_window taller";
      "ctrl+alt+j"  = "resize_window shorter";
    };
  };
}