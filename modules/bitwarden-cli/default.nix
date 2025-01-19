{ pkgs }:

pkgs.symlinkJoin {
  name = "bitwarden-cli-deps";
  paths = with pkgs; [
    (bitwarden-cli.override {
      nativeBuildInputs = [ python3 ];
      buildInputs = [ nodejs.gyp ];
    })
  ];
}
