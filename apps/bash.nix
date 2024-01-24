{ config, pkgs, ... }:

{
  imports = [ ./direnv/home.nix ];

  programs.bash = {
    enable = true;
    shellAliases = { vim = "nvim"; };
  };
}
