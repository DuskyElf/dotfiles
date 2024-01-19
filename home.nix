{ config, pkgs, inputs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  home-manager.users.duskyelf = { pkgs, ... }: {
    imports = [ ./apps/git.nix ./apps/bash.nix ];

    home.stateVersion = "23.11"; # Don't change

    home.packages = with pkgs; [ firefox kitty ];
  };
}
