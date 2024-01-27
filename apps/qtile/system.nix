{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neofetch
    htop-vim
    wlr-randr
    (python3.withPackages (ps: with ps; [ qtile qtile-extras ]))
  ];

  services.xserver.windowManager.qtile = {
    enable = true;
    backend = "wayland";

    # extraPackages = (ps: with ps; [ qtile-extras ]);
  };
}
