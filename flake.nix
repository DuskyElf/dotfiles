{
  description = "DuskyElf's NixOs Config";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-small.url =
      "nixpkgs/nixos-unstable-small"; # TODO: https://nixpk.gs/pr-tracker.html?pr=286058
    # nixpkgs.url = "nixpkgs/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nixpkgs-small, stylix, home-manager, nixvim, ... }:
    let
      overlays = final: prev: {
        ollama = prev.ollama.overrideAttrs (old: { version = "0.1.23"; });
      };

      lib = nixpkgs.lib;
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          cudaSupport = true;
        };
        overlays = [ overlays ];
      };

      pkgs-small = import nixpkgs-small {
        inherit system;
        config = {
          allowUnfree = true;
          cudaSupport = true;
        };
        overlays = [ overlays ];
      };
    in {
      nixosConfigurations = {
        asus-cool = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-small; };
          modules =
            [ ./configuration.nix stylix.nixosModules.stylix ./stylix.nix ];
        };
      };

      homeConfigurations.duskyelf = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit nixvim; };

        modules = [ ./home.nix stylix.homeManagerModules.stylix ./stylix.nix ];
      };

      devShells.x86_64-linux.default = pkgs.mkShell {
        # Developer enviorment for configuring qtile
        nativeBuildInputs = with pkgs;
          [ (python3.withPackages (ps: with ps; [ qtile qtile-extras ])) ];

        shellHook = ''
          echo "This is DuskyElf's Dotfiles"
          export NIXPKGS_ALLOW_UNFREE=1
        '';
      };
    };

}
