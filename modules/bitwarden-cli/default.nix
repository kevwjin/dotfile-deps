{ pkgs }:

pkgs.symlinkJoin {
  name = "bitwarden-cli-deps";
  paths = with pkgs; [
    bitwarden
  ];
}
