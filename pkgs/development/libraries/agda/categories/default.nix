{ stdenv, agda, fetchgit, AgdaStdlib }:

agda.mkDerivation (self: rec {
  r = "7b45b546ee5cd80aff8e9e9a24686c78d6d7bb99";
  name = "categories";
  version = "git-${r}";

  src = fetchgit {
    url = "https://github.com/copumpkin/categories.git";
    rev = "${r}";
    sha256 = "577ffebc5a4c77afb9a1894c2153a74e63d0ea5d0f471050e6d6327f8cd3d607";
  };

  buildDepends = [ AgdaStdlib ];
  sourceDirectories = [ "Categories" "Graphs" ];

  meta = {
    homepage = "https://github.com/copumpkin/categories";
    description = "Categories parametrized by morphism equality, in Agda";
    license = stdenv.lib.licenses.bsd3;
    maintainers = with stdenv.lib.maintainers; [ fuuzetsu ];
  };
})