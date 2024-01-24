{ config, pkgs, ... }:

{
  imports = [ ./direnv.nix ];

  programs.bash = {
    enable = true;
    shellAliases = { vim = "nvim"; };
  };
}
