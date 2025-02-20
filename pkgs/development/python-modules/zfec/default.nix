{
  lib,
  buildPythonPackage,
  fetchPypi,
  hypothesis,
  pyutil,
  setuptools,
  twisted,
}:

buildPythonPackage rec {
  pname = "zfec";
  version = "1.6.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xaGGHCU7USaYwuczrk2D9eLW6myIG32+ETNLaU51WgA=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ pyutil ];

  nativeCheckInputs = [
    hypothesis
    twisted
  ];

  checkPhase = ''
    trial zfec
  '';

  pythonImportsCheck = [ "zfec" ];

  meta = with lib; {
    homepage = "https://github.com/tahoe-lafs/zfec";
    description = "Fast erasure codec which can be used with the command-line, C, Python, or Haskell";
    longDescription = ''
      Fast, portable, programmable erasure coding a.k.a. "forward
      error correction": the generation of redundant blocks of
      information such that if some blocks are lost then the
      original data can be recovered from the remaining blocks. The
      zfec package includes command-line tools, C API, Python API,
      and Haskell API.
    '';
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ prusnak ];
  };
}
