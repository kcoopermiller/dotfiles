{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      jdinhlife.gruvbox
      ms-vscode-remote.remote-containers
      ms-azuretools.vscode-docker
    ];
  };
}
