{ lib, buildPythonPackage, fetchPypi
, pytest, heapdict, pythonOlder }:

buildPythonPackage rec {
  pname = "zict";
  version = "3.0.0";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4yHiY7apeq/AeQw8+zwEZWtwZuZzjDf//MqV2APJ+6U=";
  };

  disabled = pythonOlder "3.6";

  buildInputs = [ pytest ];
  propagatedBuildInputs = [ heapdict ];

  meta = with lib; {
    description = "Mutable mapping tools.";
    homepage = "https://github.com/dask/zict";
    license = licenses.bsd3;
    maintainers = with maintainers; [ teh ];
  };
}
