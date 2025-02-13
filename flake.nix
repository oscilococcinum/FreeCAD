#This flake is intentionaly impure.
#To build freecad-dev from source add --impure at the end of nix build
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    repo = {
      url = "https://github.com/oscilococcinum/FreeCAD";
      type = "git";
      ref = "adds-hyperelastic-material-models";
      submodules = true;
      flake = false;
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    packages = builtins.listToAttrs (map (system: {
      name = system;
      value = with import nixpkgs { inherit system; config.allowUnfree = true;}; rec {

        freecad-build = pkgs.callPackage (import ./package/nix/freecad/package.nix) { repo = inputs.repo; };

        default = freecad-build;
      };
    })[ "x86_64-linux" "aarch64-linux" ]);

    devShells = builtins.listToAttrs (map (system: {
      name = system;
      value = with import nixpkgs { inherit system; config.allowUnfree = true;}; rec {

        freecad-devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            calculix
            gmsh
          ];
          shellHook = '''';
        };

        default = freecad-devShell;
      };
    })[ "x86_64-linux" "aarch64-linux" ]);
  };
}
