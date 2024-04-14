{
  description = "NixOS Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake /path/to/flake#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        # specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          {
            _module.args = { inherit inputs outputs; };
          }

          # Home Manager module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.cooper = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };
          }
        ]; 
      };
    };
  };
}
