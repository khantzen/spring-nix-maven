{ lib, fetchFromGitHub, jre, makeWrapper, maven }:

maven.buildMavenPackage rec {
  pname = "nix-spring-app";
  version = "1.0.0";

  src = ./.;
  mvnHash = "sha256-0PntACYQgDshvUd0BILJgzlM0DHzM6qUFfPBsxvoLWw=";

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin $out/share/nix-spring-app
    install -Dm644 /build/nix-spring-app/target/nix-spring-app-$version.jar $out/share/nix-spring-app

    makeWrapper ${jre}/bin/java $out/bin/nix-spring-app \
      --add-flags "-jar $out/share/nix-spring-app/nix-spring-app-$version.jar"
  '';
}