{
  fetchurl,
  appimageTools,
  src
}:

appimageTools.wrapType2 {
  pname = "freecad";
  version = "weekly";
  inherit src;
}
