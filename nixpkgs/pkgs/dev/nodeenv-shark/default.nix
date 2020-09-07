{ stdenv
, pythonPackages }:

pythonPackages.buildPythonPackage rec {
  pname = "nodeenv";
  version = "1.3.3";
  name = "${pname}-shark";

  src = pythonPackages.fetchPypi {
    inherit pname version;
    sha256 = "ad8259494cf1c9034539f6cced78a1da4840a4b157e23640bc4a0c0546b0cb7a";
  };

  # Tests not included in PyPI tarball
  doCheck = false;
  propagatedBuildInputs = with pythonPackages; [ setuptools ];

  meta = with stdenv.lib; {
    description = "Node.js virtual environment builder";
    homepage = https://github.com/ekalinin/nodeenv;
    license = licenses.bsd3;
  };
}
