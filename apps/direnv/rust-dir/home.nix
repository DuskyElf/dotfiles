{ config, pkgs, ... }:

{
  home.file."${config.home.homeDirectory}/Projects/rust/.envrc".text = ''
    use nix
  '';
  home.file."${config.home.homeDirectory}/Projects/rust/shell.nix".source = ./shell.nix;
}
