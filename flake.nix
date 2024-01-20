{
  description = "DuskyElf's NixOs Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, stylix, home-manager, nixvim, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        asus-cool = lib.nixosSystem {
          inherit system;
          modules =
            [ ./configuration.nix stylix.nixosModules.stylix ./stylix.nix ];
        };
      };

      homeConfigurations.duskyelf =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { nixvim = nixvim; };

          modules =
            [ ./home.nix stylix.homeManagerModules.stylix ./stylix.nix ];
        };

      # Developer enviorment for configuring qtile
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs;
          [ (python3.withPackages (ps: with ps; [ qtile ])) ];
      };
    };

}
