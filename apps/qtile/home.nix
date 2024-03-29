{ config, pkgs, ... }:

{
  imports = [ ../lf.nix ];

  home.file."${config.home.homeDirectory}/.config/qtile/config.py".source =
    ./config.py;

  home.file."${config.home.homeDirectory}/.config/qtile/nixos.png".source =
    ./nixos.png;

  home.file."${config.home.homeDirectory}/.config/qtile/autostart.sh" = {
    source = ./autostart.sh;
    executable = true;
  };

  # Wayland for electron apps
  home.sessionVariables = { NIXOS_OZONE_WL = "1"; };

  home.file."${config.home.homeDirectory}/.config/qtile/stylix.py".text = ''
    base00   = "${config.lib.stylix.colors.base00}"
    base01   = "${config.lib.stylix.colors.base01}"
    base02   = "${config.lib.stylix.colors.base02}"
    base03   = "${config.lib.stylix.colors.base03}"
    base04   = "${config.lib.stylix.colors.base04}"
    base05   = "${config.lib.stylix.colors.base05}"
    base06   = "${config.lib.stylix.colors.base06}"
    base07   = "${config.lib.stylix.colors.base07}"
    base08   = "${config.lib.stylix.colors.base08}"
    base09   = "${config.lib.stylix.colors.base09}"
    base0A   = "${config.lib.stylix.colors.base0A}"
    base0B   = "${config.lib.stylix.colors.base0B}"
    base0C   = "${config.lib.stylix.colors.base0C}"
    base0D   = "${config.lib.stylix.colors.base0D}"
    base0E   = "${config.lib.stylix.colors.base0E}"
    base0F   = "${config.lib.stylix.colors.base0F}"
    font     = "${config.stylix.fonts.monospace.name}"
    fontsize = ${toString config.stylix.fonts.sizes.desktop}
    image    = "${config.stylix.image}"
  '';
}
