{
  fetchurl,
  appimageTools
}:

appimageTools.wrapType2 {
  pname = "freecad";
  version = "weekly";
  src = fetchurl {
    url = "https://github.com/FreeCAD/FreeCAD-Bundle/releases/download/weekly-builds/FreeCAD_weekly-builds-40041-conda-Linux-x86_64-py311.AppImage";
    hash = "sha256:077wijg3kwx4jvgvi06nr5898xzw7q3yz76q2f588ijvcj7dn6hs";
  };
}
