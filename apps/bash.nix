{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = { vim = "nvim"; };
  };
}
