{
  description = "NixOS and Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hmModule = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.morpheus = import ./home.nix;
        home-manager.extraSpecialArgs = { inherit inputs; };
      };
    in
    {
      nixosConfigurations = {
        # VMware Fusion host
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/vm/configuration.nix
            home-manager.nixosModules.home-manager
            hmModule
          ];
        };

        # Hetzner VPS host
        vps = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/vps/configuration.nix
            home-manager.nixosModules.home-manager
            hmModule
          ];
        };
      };

      # Standalone home-manager (for non-NixOS systems)
      homeConfigurations.morpheus = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
      };
    };
}
