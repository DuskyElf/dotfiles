{ config, pkgs, ... }:

{
  home.file."/home/duskyelf/.config/qtile/config.py".source = ./config.py;
}
