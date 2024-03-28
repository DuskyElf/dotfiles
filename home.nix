{ config, pkgs, nixvim, ... }:

{
  imports = [
    ./apps/qtile/home.nix

    nixvim.homeManagerModules.nixvim
    ./apps/nixvim.nix

    ./apps/git.nix
    ./apps/bash.nix
    ./apps/alacritty.nix
  ];

  home.username = "duskyelf";
  home.homeDirectory = "/home/duskyelf";

  home.packages = with pkgs; [ firefox alacritty ollama beeper ];

  home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
  };

  stylix.targets.alacritty.enable = false;

  home.stateVersion = "23.11"; # Don't change
  programs.home-manager.enable = true;
}
