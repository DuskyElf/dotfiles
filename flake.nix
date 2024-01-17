{
    description = "DuskyElf's NixOs Config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";

        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        stylix.url = "github:danth/stylix";
    };

    outputs = { self, nixpkgs, ... }@inputs :
        let
        lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    in {
        nixosConfigurations = {
            asus-cool = lib.nixosSystem {
                inherit system;
                specialArgs = { inherit inputs; };
                modules = [
                    ./configuration.nix
                        inputs.home-manager.nixosModules.default
                        inputs.stylix.nixosModules.stylix
                ];
            };
        };
    };

}
