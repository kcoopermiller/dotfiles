{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # inputs.hyprland.homeManagerModules.default
    ./programs
  ];

  home = {
    username = "cooper";
    homeDirectory = "/home/cooper";
  };

  fonts.fontconfig.enable = true;        

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    neofetch
    obsidian
    rofi
    vesktop
    nix-index
    simplescreenrecorder
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
