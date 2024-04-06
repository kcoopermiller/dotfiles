{ config, pkgs, ... }:

{
  home = {
    sessionVariables = {
    # Nvidia
    LIBVA_DRIVER_NAME= "nvidia";
    GBM_BACKEND= "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME= "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";

    # XDG Specifications
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    };
  };
}
