{lib, pkgs, ...}:
{
  programs.broot = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      terminal_title = "{file} 🐄";
      syntax_theme = "MochaDark";
      icon_theme = "nerdfont";
      modal = true; # Important for ubermensh users
      verbs = [
        {
          invocation = "edit";
          key = "enter";
          apply_to = "text_file";
          execution = "$EDITOR {file}";
          leave_broot = false;
        }

        # For some bug fix
        {
          invocation = "edit"; 
          key = "right";
          apply_to = "text_file";
          execution = "$EDITOR {file}";
          leave_broot = false;
        }
      ];
    };
  };
}

