{
  description = "DuskyElf's NixOs Config";

  inputs = {

    # TODO: use pkgs (unstable) instead of pkgs-master after qtile updates to nixpkgs-unstable
    # https://nixpk.gs/pr-tracker.html?pr=282869
    nixpkgs.url = "nixpkgs/master";
    # nixpkgs.url = "nixpkgs/nixos-unstable";

    # nixpkgs-stable.url = "nixpkgs/nixos-23.11";

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
