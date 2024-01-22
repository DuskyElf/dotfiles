{
  description = "DuskyElf's NixOs Config";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    # TODO: Update after https://github.com/NixOS/nixpkgs/pull/282869 gets merged
    working-qtile-extras-package.url = "nixpkgs/9e1ae78a702a764d6815dac293f460f14720d140";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, stylix, home-manager, nixvim, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      qtile-extras = inputs.working-qtile-extras-package.legacyPackages.${system}.python311Packages.qtile-extras;
    in {
      nixosConfigurations = {
        asus-cool = lib.nixosSystem {
          inherit system;
          extraArgs = { inherit qtile-extras; };
          modules =
            [ ./configuration.nix stylix.nixosModules.stylix ./stylix.nix ];
        };
      };

      homeConfigurations.duskyelf =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit nixvim; };

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
