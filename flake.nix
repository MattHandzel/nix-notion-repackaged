{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
      nixpkgs.config.permittedInsecurePackages = [
          "electron-28.3.3"
          ];
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in let pkg = pkgs.callPackage ./package.nix { };
    in {
      packages.x86_64-linux.default = pkg;
      packages.x86_64-linux.notion-repackaged = pkg;
    };
}
