{
  fetchurl,
  appimageTools
}:

appimageTools.wrapType2 {
  pname = "freecad";
  version = "realthunder";
  src = fetchurl {
    url = "https://github.com/realthunder/FreeCAD/releases/download/20241003stable/FreeCAD-Link-Stable-Linux-x86_64-py3.11-20241003.AppImage";
    hash = "sha256:0azc1mavngskl8y2m6ghwy81r7xrs3013mhxr8p0va6fwbszaa15";
  };
}
