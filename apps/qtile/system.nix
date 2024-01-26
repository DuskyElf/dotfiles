{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wlr-randr ];

  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "wayland";

    extraPackages = (ps: with ps; [ qtile-extras ]);
  };
}
