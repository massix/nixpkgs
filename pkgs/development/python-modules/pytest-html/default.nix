{ lib, buildPythonPackage, fetchPypi, pythonOlder
, pytest, pytest-metadata, setuptools-scm }:

buildPythonPackage rec {
  pname = "pytest-html";
  version = "4.0.2";
  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iGgrno5ROSRyVGpwohObJ9a8GDSkr9PkHaM8nZ+R5KQ=";
  };

  nativeBuildInputs = [ setuptools-scm ];
  buildInputs = [ pytest ];
  propagatedBuildInputs = [ pytest-metadata ];

  meta = with lib; {
    description = "Plugin for generating HTML reports";
    homepage = "https://github.com/pytest-dev/pytest-html";
    license = licenses.mpl20;
    maintainers = with maintainers; [ mpoquet ];
  };
}
