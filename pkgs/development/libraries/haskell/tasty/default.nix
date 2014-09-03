# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, ansiTerminal, async, deepseq, mtl, optparseApplicative
, regexTdfaRc, stm, tagged, unboundedDelays
}:

cabal.mkDerivation (self: {
  pname = "tasty";
  version = "0.9.0.1";
  sha256 = "1v3grjqvv2rc66s0rkmzsdv4h81vkkjar3flyd07c83qd2gpkv3c";
  buildDepends = [
    ansiTerminal async deepseq mtl optparseApplicative regexTdfaRc stm
    tagged unboundedDelays
  ];
  meta = {
    homepage = "http://documentup.com/feuerbach/tasty";
    description = "Modern and extensible testing framework";
    license = self.stdenv.lib.licenses.mit;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ ocharles ];
  };
})
