{ pkgs, ... }:
{
  wayland.windowManager.hyprland.extraConfig = ''
    # Log WLR errors and logs to the hyprland log. Recommended
    env = HYPRLAND_LOG_WLR, 1

    # Tell Xwayland to use a cursor theme
    env = XCURSOR_THEME, Xcursor-breeze

    # Set cursor size
    env = XCURSOR_SIZE, 24

    # env = XDG_SESSION_TYPE, wayland

    env = NIXOS_OZONE_WL, "1"

    env = LIBVA_DRIVER_NAME,nvidia
    env = XDG_SESSION_TYPE,wayland
    env = GBM_BACKEND,nvidia-drm
    env = __GLX_VENDOR_LIBRARY_NAME,nvidia
    env = WLR_NO_HARDWARE_CURSORS,1
  '';
}
