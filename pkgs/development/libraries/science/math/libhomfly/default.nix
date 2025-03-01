{ lib, stdenv
, fetchFromGitHub
, autoreconfHook
, boehmgc
}:

stdenv.mkDerivation rec {
  version = "1.02r5";
  pname = "libhomfly";

  src = fetchFromGitHub {
    owner = "miguelmarco";
    repo = "libhomfly";
    rev = version;
    sha256 = "1szv8iwlhvmy3saigi15xz8vgch92p2lbsm6440v5s8vxj455bvd";
  };

  buildInputs = [
    boehmgc
  ];

  nativeBuildInputs = [
    autoreconfHook
  ];

  doCheck = true;

  meta = with lib; {
    homepage = "https://github.com/miguelmarco/libhomfly/";
    description = "Library to compute the homfly polynomial of knots and links";
    license = licenses.unlicense;
    maintainers = teams.sage.members;
    platforms = platforms.all;
  };
}
