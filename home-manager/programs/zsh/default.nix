{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#nixos";
      clean = "nix-collect-garbage -d";
    };
  };
}
