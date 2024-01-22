{ config, pkgs, qtile-extras, ... }:

{
  environment.systemPackages = with pkgs; [
    wlr-randr
    (python3.withPackages (ps: [ qtile-extras ]))
  ];

  services.xserver.windowManager.qtile.enable = true;
}
