{
  description = "DM CV";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system}.default = pkgs.stdenvNoCC.mkDerivation {
        name = "test";
        src = ./.;
        buildInputs = [
            (pkgs.texlive.combine {
                inherit (pkgs.texlive) 
                scheme-medium
                latexmk
                fancyhdr
                collection-luatex
                tcolorbox
                tikz-cd
                tikzfill
                environ
                # longtable
                enumitem
                geometry
                preprint
                hyperref
                fontawesome5
                titlesec
                xifthen;
            })
        ];
        buildPhase = ''
            export HOME=$(mktemp -d)
            mkdir $out
            make
            cp -r build/*.pdf $out
        '';
        phases = [ "unpackPhase" "buildPhase" ];
    };
  };
}