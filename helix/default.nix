{ inputs, pkgs, ... }:
{
  # test if language is supported with e.g. `hx --health python`
  home.packages = with pkgs; [
    # cpp dependencies
    clang-tools
    lldb

    # nix dependencies
    nil

    # typescript
    nodePackages_latest.typescript-language-server

    # python
    python311Packages.python-lsp-server
    nodePackages_latest.pyright
    python311Packages.debugpy # debugger
    black # formatter

    # markdown
    marksman

    # formatter
    nodePackages.prettier
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    package = inputs.helix.packages.${pkgs.system}.default;
    settings = {
      theme = "catppuccin_espresso";
      editor = {
        true-color = true;
        line-number = "relative";
        idle-timeout = 0;
        color-modes = true;
      };
    };
    languages = {
      
      language = [
        {
          name = "markdown";
          soft-wrap.enable = true;
          formatter = { command = "prettier"; args = ["--parser" "markdown"]; };
          auto-format = true;
        }
        {
          name = "cpp";
        }
        {
          name = "nix";
        }
        {
          name = "rust";
          language-servers = [ "rust-analyzer" ];

          debugger = {
            name = "lldb-vscode";
            transport = "stdio";
            command = "lldb-vscode";
            templates = [{
              name = "binary";
              request = "launch";
              completion = [ { name = "binary"; completion = "filename"; } ];
              args = { program = "{0}";};
            }];
          };
        }
        {
          name = "python"; 
          auto-format = true;
          scope = "source.python";
          shebangs = ["python"];
          roots = ["setup.py" "setup.cfg" "pyproject.toml"];
          formatter = { command = "black"; args = ["--quiet" "-"]; };
          language-servers = [ "pyright" ];
        }
      ];
    };
    themes = {
      catppuccin_espresso = {
        "inherits" = "catppuccin_mocha";
        "ui.virtual.inlay-hint" = {
          fg = "surface1";
        };
        "ui.background" = "{}";
      };
    };
  };
}

#  _____________ 
# < wsup brotha >
#  ------------- 
#         \   ^__^
#          \  (--)\_______
#             (__)\       )\/\
#                 ||----w |
#                 ||     ||
