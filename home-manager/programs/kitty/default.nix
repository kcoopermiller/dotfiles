{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono Nerd Font"; 
    extraConfig = builtins.readFile ./kitty.conf;
  };
}
