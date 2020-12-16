{ pkgs ? import nixpkgs {}
}:

pkgs.stdenv.mkDerivation {
  name = "LaTeX-env";
  src = ./.;
  buildInputs = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-small

      	# Add other LaTeX libraries (packages) here as needed, e.g:
        # stmaryrd amsmath pgf

        # build tools
        latexmk;
      })
  ];
  buildPhase = "make";

  meta = with lib; {
    description = "Describe your document here";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}
