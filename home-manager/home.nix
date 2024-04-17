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

  home.packages = with pkgs; [
    neofetch
    obsidian
    rofi
    discord
  ];

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
