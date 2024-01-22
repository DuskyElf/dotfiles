{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wlr-randr ];
  services.xserver.windowManager.qtile.enable = true;
}
