{ pkgs, config, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd"
      "cd"
    ];
  };

  programs.eza = {
    enable = true;
    icons = true;
    git = true;
  };

  programs.direnv = { # you need this nigga
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # https://nixos.wiki/wiki/Zsh
  programs.zsh = {
    enable = true;
    # autocd = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    # # "^[OA" and "^[OB" fix up and down not working... (source: https://www.reddit.com/r/zsh/comments/kae8yg/plugin_zshhistorysubstringsearch_not_working/)
    historySubstringSearch.enable = true;
    historySubstringSearch.searchUpKey = [ "^[[A" "^[OA" ];
    historySubstringSearch.searchDownKey = [ "^[[B" "^[OB" ];
    
    # oh-my-zsh = {
    #   enable = true;
    #   plugins = [ "git" ];
    #   # theme = "robbyrussell";
    # };

    shellAliases = {
      la = "exa -la --icons";
      ls = "exa -a --icons";
      rm = "rip";
      update = "sudo nixos-rebuild switch --upgrade --flake /home/batman/nixos#zenneh";
      update-dots = "home-manager switch --update-input dots --flake ~/home#ukiyo";
    };



    # use `cat -v` for keys
    initExtra = ''
      # Exports
      # export AUTO_NOTIFY_THRESHOLD=10 # Notify only if commands take longer than 10 seconds
      # export XDG_DATA_HOME="$HOME/.local/share"

      export XDG_DATA_DIRS="$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
      
      # == Keybinds ==
      # ctrl + remove
      # bindkey '^H' backward-kill-word # ctrl + backspace
      # bindkey '5~' kill-word # ctrl + delete

      # ctrl + arrows
      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word

      # for bartip log file
      export BARTIB_FILE="/home/batman/.activities.bartib"
    '';
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
    ];
  };
}
