{
  pkgs ? import <nixpkgs> {}, 
} :

pkgs.stdenv.mkDerivation {
  name = "manuscript";
  # author = "dm";

  src = ./.;

  buildInputs = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
      collection-basic
      collection-bibtexextra
      collection-binextra
      collection-context
      collection-fontsextra
      collection-fontsrecommended
      collection-fontutils
      collection-formatsextra
      collection-langenglish
      collection-langfrench
      collection-latex
      collection-latexextra
      collection-latexrecommended
      collection-luatex
      collection-mathscience
      # collection-metapost
      # collection-music
      # collection-pictures
      # collection-plaingeneric
      # collection-pstricks
      # collection-publishers
      # collection-texworks
      # collection-xetex
      amsfonts
      adjustbox
      algorithms
      algorithm2e
      algpseudocodex
      fontawesome5
      fontspec
      fncychap
      fvextra # minted dependency
      glossaries
      mfirstuc  # glossaries dependency 
      datatool # glossaries dependency
      hyperref      
      minitoc
      minted
      subfig
      textcase
      tracklang  # glossaries depednec?
      xcolor
      # build-tool
      
      latexmk
      ;
    })

    pkgs.python310Packages.pygments
  ];

  buildPhase = "make";

  meta = with pkgs.lib; {
    description = "dm's manuscript";
    homepage = "https://github.com/DarkaMaul/miniature-journey";
  };
}