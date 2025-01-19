{ pkgs }:

pkgs.symlinkJoin {
  name = "bitwarden-cli-deps";
  paths = with pkgs; [
    bitwarden-cli   # only bitwarden-cli is shared across machines
  ];
}
