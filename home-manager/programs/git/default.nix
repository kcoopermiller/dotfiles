{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName  = "Cooper Miller";
    userEmail = "kcoopermiller9@gmail.com";
  };
}
