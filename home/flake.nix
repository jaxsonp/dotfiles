{
	description = "Jaxson's home configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		plasma-manager = {
			url = "github:nix-community/plasma-manager";
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.home-manager.follows = "home-manager";
		};
	};

	outputs =
		inputs@{
			nixpkgs,
			home-manager,
			plasma-manager,
			...
		}:
		let
			system = "x86_64-linux";
			pkgs = nixpkgs.legacyPackages.${system};
		in
		{
			homeConfigurations.jaxson = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;

				modules = [
					inputs.plasma-manager.homeManagerModules.plasma-manager
					./home.nix
				];
			};
		};
}
