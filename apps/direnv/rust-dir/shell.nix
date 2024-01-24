let
  rust_overlay = import (builtins.fetchTarball
    "https://github.com/oxalica/rust-overlay/archive/master.tar.gz");
  pkgs = import <nixpkgs> { overlays = [ rust_overlay ]; };

  #rustVersion = "1.69.0";
  rustVersion = "latest";
  rust = pkgs.rust-bin.stable.${rustVersion}.default.override {
    extensions = [
      "rust-src" # for rust-analyzer
    ];
  };
in pkgs.mkShell {
  buildInputs = [ rust ] ++ (with pkgs;
    [ # extra packages
      gnum4
    ]);

  RUST_BACKTRACE = 1;
}

