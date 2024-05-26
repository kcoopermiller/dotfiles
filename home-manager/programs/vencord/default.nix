{ config, pkgs, ... }:

{
  home.file.".config/vesktop/themes/midnight-vencord.theme.css".text = ''
    @import "https://refact0r.github.io/midnight-discord/flavors/midnight-vencord.theme.css"
  '';
}
