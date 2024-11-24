{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      # Overlay to modify permittedInsecurePackages
      myOverlay = self: super: {
        nixpkgs.config.permittedInsecurePackages = [
          "electron-28.3.3"
        ];
      };
      
      pkgs = import nixpkgs {
        overlays = [ myOverlay ];  # Applying overlay
        system = "x86_64-linux";
      };
      pkg = pkgs.callPackage ./package.nix { };
    in {
      packages.x86_64-linux.default = pkg;
      packages.x86_64-linux.notion-repackaged = pkg;
    };
}
