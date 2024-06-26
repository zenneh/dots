{ pkgs, ... } : {
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs;
      [
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = '' 
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_date_time "%H:%M"
          '';
        }
        {
            plugin = tmuxPlugins.resurrect;
            extraConfig = ''
            set -g @resurrect-strategy-vim 'session'
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
            '';
        }
        {
            plugin = tmuxPlugins.continuum;
            extraConfig = ''
            set -g @continuum-restore 'on'
            set -g @continuum-boot 'on'
            set -g @continuum-save-interval '10'
            '';
        }
        tmuxPlugins.better-mouse-mode
      ];
    extraConfig = ''
      # vim-like pane resizing  
      bind -r C-k resize-pane -U
      bind -r C-j resize-pane -D
      bind -r C-h resize-pane -L
      bind -r C-l resize-pane -R

      # vim-like pane switching
      bind -r k select-pane -U 
      bind -r j select-pane -D 
      bind -r h select-pane -L 
      bind -r l select-pane -R 

      unbind Up     
      unbind Down   
      unbind Left   
      unbind Right  

      unbind C-Up   
      unbind C-Down 
      unbind C-Left 
      unbind C-Right

      # splitting
      unbind %
      unbind '"'
      bind s split-window -h -c "#{pane_current_path}"
      bind v split-window -v -c "#{pane_current_path}"

    '';
  };
}
