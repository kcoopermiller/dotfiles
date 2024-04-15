{ config, pkgs, ... }:

{
  home.file.".config/rofi/config.rasi".text = ''
    @import "~/.config/home-manager/programs/rofi/themes/gruv.rasi"
  '';
}
