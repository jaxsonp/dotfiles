{
  description = "My home manager configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
       lib = nixpkgs.lib;
       system = "x86_64-linux";
       pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        jaxson = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };
}
