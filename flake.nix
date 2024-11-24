{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.permittedInsecurePackages = [
        "electron-28.3.3"
      ];
    };
    pkg = pkgs.callPackage ./package.nix { };
  in {
    packages.x86_64-linux.default = pkg;
    packages.x86_64-linux.notion-repackaged = pkg;
  };
}
