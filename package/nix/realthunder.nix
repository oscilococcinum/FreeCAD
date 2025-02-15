{
  fetchurl,
  appimageTools,
  src
}:

appimageTools.wrapType2 {
  pname = "freecad";
  version = "realthunder";
  inherit src;
}
