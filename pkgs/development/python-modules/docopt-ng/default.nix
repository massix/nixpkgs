{ lib
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "docopt-ng";
  version = "0.9.0";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kcbaELW7by6eJTRYKfuCeMeK8Bn2/ECIetSbBgSDsdc=";
  };

  pythonImportsCheck = [ "docopt" ];
  doCheck = false; # no tests in the package

  meta = with lib; {
    description = "More-magic command line arguments parser. Now with more maintenance!";
    homepage = "https://github.com/bazaar-projects/docopt-ng";
    license = licenses.mit;
    maintainers = with maintainers; [ fgaz ];
  };
}
