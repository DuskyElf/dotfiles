{ config, pkgs, ... }:

{
  home.file."${config.home.homeDirectory}/.config/qtile/config.py".source =
    ./config.py;

  home.file."${config.home.homeDirectory}/.config/qtile/autostart.sh" = {
    source = ./autostart.sh;
    executable = true;
  };

  home.file."${config.home.homeDirectory}/.config/qtile/stylix.py".text = ''
    base01 = "${config.lib.stylix.colors.base01}"
    base02 = "${config.lib.stylix.colors.base02}"
    base03 = "${config.lib.stylix.colors.base03}"
    base04 = "${config.lib.stylix.colors.base04}"
    base05 = "${config.lib.stylix.colors.base05}"
    base06 = "${config.lib.stylix.colors.base06}"
    base07 = "${config.lib.stylix.colors.base07}"
    base08 = "${config.lib.stylix.colors.base08}"
    base09 = "${config.lib.stylix.colors.base09}"
    base0A = "${config.lib.stylix.colors.base0A}"
    base0B = "${config.lib.stylix.colors.base0B}"
    base0C = "${config.lib.stylix.colors.base0C}"
    base0D = "${config.lib.stylix.colors.base0D}"
    base0E = "${config.lib.stylix.colors.base0E}"
    base0F = "${config.lib.stylix.colors.base0F}"
    font   = "${config.stylix.fonts.monospace.name}"
    image  = "${config.stylix.image}"
  '';
}
