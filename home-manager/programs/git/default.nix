{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
