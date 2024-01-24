{ config, pkgs, ... }:

{
  imports = [ ./rust-dir/home.nix ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
