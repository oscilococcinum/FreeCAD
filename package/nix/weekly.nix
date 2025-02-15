{
  fetchurl,
  appimageTools,
  src-flake
}:

appimageTools.wrapType2 {
  pname = "freecad";
  version = "weekly";
  src = src-flake;
}
