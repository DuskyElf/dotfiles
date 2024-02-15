{ config, pkgs, ... }:

{
  programs.lf = {
    enable = true;

    settings = {
      icons = true;
      preview = true;
      hidden = false;
      drawbox = true;
      ignorecase = true;
    };

    commands = {
      vim = "$nvim $f";
      bash = "$bash";
    };

    keybindings = {
      e = "vim";
      t = "bash";

      "gp" = "cd ~/Projects";
      "g." = "cd ~/.dotfiles";
    };
  };
}
