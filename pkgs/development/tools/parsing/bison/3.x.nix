{ stdenv, fetchurl, m4, perl, help2man }:

stdenv.mkDerivation rec {
  name = "bison-3.2.2";

  src = fetchurl {
    url = "mirror://gnu/bison/${name}.tar.gz";
    sha256 = "0v3q6ym34krb4iskg0pspvpm35wmp3gx9njb9c35cv0w0h0j5z9z";
  };

  patches = []; # remove on another rebuild

  nativeBuildInputs = [ m4 perl ] ++ stdenv.lib.optional stdenv.isSunOS help2man;
  propagatedBuildInputs = [ m4 ];

  doCheck = false; # fails
  doInstallCheck = false; # fails

  meta = {
    homepage = https://www.gnu.org/software/bison/;
    description = "Yacc-compatible parser generator";
    license = stdenv.lib.licenses.gpl3Plus;

    longDescription = ''
      Bison is a general-purpose parser generator that converts an
      annotated context-free grammar into an LALR(1) or GLR parser for
      that grammar.  Once you are proficient with Bison, you can use
      it to develop a wide range of language parsers, from those used
      in simple desk calculators to complex programming languages.

      Bison is upward compatible with Yacc: all properly-written Yacc
      grammars ought to work with Bison with no change.  Anyone
      familiar with Yacc should be able to use Bison with little
      trouble.  You need to be fluent in C or C++ programming in order
      to use Bison.
    '';

    platforms = stdenv.lib.platforms.unix;
  };

  passthru = { glrSupport = true; };
}
