final: prev: {
  macism = final.stdenv.mkDerivation rec {
    pname = "macism";
    version = "v3.1.1";

    src = final.fetchFromGitHub {
      owner = "laishulu";
      repo = "macism";
      rev = version;
      hash = "sha256-YuOFhCd+hc81x+59EVXPo9JZZSA2JJX0zNnU3UlM7Ts=";
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
