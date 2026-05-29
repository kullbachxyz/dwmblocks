{ lib
, stdenv
, xorg
}:

stdenv.mkDerivation {
  pname = "dwmblocks-custom";
  version = "local";

  src = ./.;

  buildInputs = [
    xorg.libX11
  ];

  prePatch = ''
    if [ -f config.mk ]; then
      sed -i "s|/usr/local|$out|g" config.mk
      sed -i "s|^X11INC = .*|X11INC = ${xorg.libX11.dev}/include|g" config.mk
      sed -i "s|^X11LIB = .*|X11LIB = ${xorg.libX11}/lib|g" config.mk
    fi
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin

    if grep -q '^install:' Makefile; then
      make PREFIX=$out install
    else
      cp dwmblocks $out/bin/
    fi

    runHook postInstall
  '';

  meta = {
    description = "Custom local dwmblocks build";
    homepage = "https://github.com/torrinfail/dwmblocks";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
