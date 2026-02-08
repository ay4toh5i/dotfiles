final: prev: {
  macism = final.stdenv.mkDerivation {
    pname = "macism";
    version = "v3.0.10";

    src = final.fetchFromGitHub {
      owner = "laishulu";
      repo = "macism";
      rev = "master";
      hash = "sha256-DbrPjaaM4FNtoMn65uDc/uR5V+DbqZUgD3j5kYLz5KA=";
    };

    nativeBuildInputs = [ final.swift ];

    buildPhase = ''
      runHook preBuild
      make
      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall
      mkdir -p $out/bin
      cp macism $out/bin/
      runHook postInstall
    '';

    meta = with final.lib; {
      description = "Command line macOS Input Source Manager";
      homepage = "https://github.com/laishulu/macism";
      license = licenses.mit;
      platforms = platforms.darwin;
    };
  };
}
