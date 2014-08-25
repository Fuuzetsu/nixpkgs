{ cabal, fetchgit, filemanip, Agda, AgdaStdlib }:

cabal.mkDerivation (self: rec {
  pname = "categories";
  version = "git-b3433c72fd99fd7c7f317f870ab1dcec32339512";

  src = fetchgit {
    url = "https://github.com/copumpkin/categories.git";
    rev = "9b80813c3553d18fbb27d728cebfdeaf4f547993";
    sha256 = "8c3068cc9eb0ec47c443f48a18a728a02a4ef94e7d4b06368941de2620d55ee7";
  };

  patches = [ ./caballib.patch ];

  buildDepends = [ filemanip Agda AgdaStdlib ];

  postInstall = ''
    mkdir -p $out/share
    ${Agda}/bin/agda -i . -i ${AgdaStdlib}/share/agda Everything.agda
    cp -pR Categories Graphs $out/share
  '';

  meta = {
    homepage = "https://github.com/copumpkin/categories";
    description = "Categories parametrized by morphism equality, in Agda";
    license = "unknown";
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
