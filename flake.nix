{
  description = "Avantiris – Website des Vereins";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {nixpkgs, ...}: let
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
    forAll = f: nixpkgs.lib.genAttrs systems (s: f nixpkgs.legacyPackages.${s});
  in {
    # `nix develop` gives you node (website) and typst (statutes PDF)
    devShells = forAll (pkgs: {
      default = pkgs.mkShell {
        packages = [
          pkgs.nodejs_22
          pkgs.typst
        ];
      };
    });
  };
}
