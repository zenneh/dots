 {inputs, pkgs, config, ... } :
{

programs.wezterm = {
  enable = true;
  enableZshIntegration = true;
  package = inputs.wezterm.packages.${pkgs.system}.default;
  extraConfig = ''
    local config = {}
    config.enable_wayland = true
    return config
  '';
};
}
