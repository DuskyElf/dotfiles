{ config, pkgs, inputs, ... } :

{
    imports = [ inputs.nixvim.nixosModules.nixvim ];

    programs.nixvim.enable = true;

    stylix.targets.nixvim.transparent_bg = {
        main = true;
        sign_column = true;
    };
}
