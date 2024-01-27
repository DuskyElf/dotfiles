{ config, pkgs, ... }:

{
  stylix = {
    image = pkgs.fetchurl {
      url =
        "https://raw.githubusercontent.com/zhichaoh/catppuccin-wallpapers/main/landscapes/Cloudsnight.jpg";
      sha256 = "jBv9iKBVQbgd1cmv+ubiJQH7qydRJZTShmwzEiJJcDA=";
    };

    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";

    opacity.terminal = 0.8;
  };
}
