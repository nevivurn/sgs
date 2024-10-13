{
  lib,
  dockerTools,
  cacert,
  tini,
}:

{ name, exe }:

dockerTools.buildLayeredImage {
  inherit name;

  contents = [ cacert ];
  config = {
    Entrypoint = [
      (lib.getExe tini)
      "--"
    ];
    Cmd = [ exe ];
  };
}
