{ config, pkgs, ... } :

{
    stylix.fonts.monospace = {
        name = "Jet Brains Mono Nerd";
        package = pkgs.udev-gothic-nf;
    };

    home.packages = with pkgs; [
        lunarvim
    ];

    home.sessionVariables = {
        EDITOR = "emacs";
    };

    home.file.".config/lvim/config.lua".source = ./config.lua;
}
