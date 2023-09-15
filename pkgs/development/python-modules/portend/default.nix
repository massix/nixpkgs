{ lib, buildPythonPackage, fetchPypi
, pytestCheckHook, setuptools-scm, tempora  }:

buildPythonPackage rec {
  pname = "portend";
  version = "3.2.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-UlCjUsGclZ12fKyHi4Kdk+XcdiWlFDOZoqANxmKP+3I=";
  };

  nativeBuildInputs = [ setuptools-scm ];

  propagatedBuildInputs = [ tempora ];

  nativeCheckInputs = [ pytestCheckHook ];

  # Some of the tests use localhost networking.
  __darwinAllowLocalNetworking = true;

  meta = with lib; {
    description = "Monitor TCP ports for bound or unbound states";
    homepage = "https://github.com/jaraco/portend";
    license = licenses.bsd3;
  };
}
