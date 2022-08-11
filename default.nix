# Run it like so
# nix-build -E 'with import <nixpkgs> { }; callPackage ./default.nix { }'
{ pkgs }:
with pkgs;
stdenv.mkDerivation {
  name = "xclipsync";
  version = "0.0.0";

  buildInputs = [ bash tk xclip ];

  inherit xclip;
  inherit tk;
  inherit bash;

  src = ./.;

  installPhase = ''
    # Make the output directory
    mkdir -p $out/bin

    # Copy the script there and make it executable
    cp xclipfrom $out/bin/
    cp xclipsync $out/bin/
    substituteAllInPlace $out/bin/xclipfrom
    substituteAllInPlace $out/bin/xclipsync
    chmod +x $out/bin/xclipfrom
    chmod +x $out/bin/xclipsync
  '';

}
