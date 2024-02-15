{ config, pkgs, nixvim, ... }:

{
  imports = [
    ./apps/qtile/home.nix

    nixvim.homeManagerModules.nixvim
    ./apps/nixvim.nix

    ./apps/git.nix
    ./apps/bash.nix
  ];

  home.username = "duskyelf";
  home.homeDirectory = "/home/duskyelf";

  home.packages = with pkgs; [ firefox alacritty ollama ];

  home.sessionVariables = {
      MOZ_ENABLE_WAYLAND = 1;
  };

  home.stateVersion = "23.11"; # Don't change
  programs.home-manager.enable = true;
}
