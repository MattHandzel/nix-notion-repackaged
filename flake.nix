{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
      
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in let pkg = pkgs.callPackage ./package.nix { };
    in {
nixpkgs.config.permittedInsecurePackages = [
          "electron-28.3.3"
          ];
      packages.x86_64-linux.default = pkg;
      packages.x86_64-linux.notion-repackaged = pkg;
    };
}
